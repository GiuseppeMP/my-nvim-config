local M = {}

local function get_diagnostic_at_cursor()
    local cur_buf = vim.api.nvim_get_current_buf()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local entrys = vim.diagnostic.get(cur_buf, { lnum = line - 1 })
    local res = {}
    for _, v in pairs(entrys) do
        if v.col <= col and v.end_col >= col then
            table.insert(res, {
                code = v.code,
                message = v.message,
                range = {
                    ['start'] = {
                        character = v.col,
                        line = v.lnum,
                    },
                    ['end'] = {
                        character = v.end_col,
                        line = v.end_lnum,
                    },
                },
                severity = v.severity,
                source = v.source or nil,
            })
        end
    end
    return res
end

local builtin = require 'telescope.builtin'

-- maybe needs to improve marks because multimodule projects (maven/gradle)
local root_markers = { 'pom.xml', 'gradlew', 'mvnw', '.git', 'settings.gradle', '.lsp_root', '.nvimrc.json' }

-- root dir, workspace and project name
local root_dir = function() return require('jdtls.setup').find_root(root_markers) end

---function format
---@param lsp_client string the name of the lsp_client, eg: jdtls, lua_ls, etc.
---@param bufnr number id of the buffer
---@param async boolean if it'll execute async
local format_callback = function(lsp_client, bufnr, async)
    -- add null_ls formatting support
    local null_ls_formatting_support = { 'pyright', 'groovyls' }


    if (utils.table_contains(null_ls_formatting_support, lsp_client)) then
        vim.lsp.buf.format()
    else
        -- add missing imports before format
        if (lsp_client == 'eslint') then
            vim.cmd.TSToolsAddMissingImports()
            vim.cmd.TSToolsOrganizeImports()
            -- -- debounce
            vim.cmd("sleep 200m")
        end
        vim.lsp.buf.format {
            buffer = bufnr,
            async = async,
            filter = function(client)
                return client.name == lsp_client
            end
        }
    end
end

---autocmd to format on save
---@param client any
---@param bufnr number
---@param lsp_client string
local create_autocmd_format_on_save = function(client, bufnr, lsp_client)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd({ "FileWritePre", "BufWritePre" }, {
            group = vim.api.nvim_create_augroup("format_lsp_attach_" .. client.name, { clear = false }),
            buffer = bufnr,
            callback = function() format_callback(lsp_client, bufnr, false) end
        })
    end
end

--- return a lua table of the .nvimrc.json at workspace/project folder
---@param client any
---@param bufnr number
---@return table
local get_project_local_settings = function(client, bufnr)
    -- get client workspace folder
    local path = client.workspace_folders[1].name
    local project_settings = nil

    -- lookup for the .nvimrc.json
    local lsp_path_settings = root_dir() .. "/.nvimrc.json"
    utils.log.info("nvimrc path for bufnr: " .. "[" ..
        bufnr .. "] lsp: \n " .. client.name .. "\n -> " .. lsp_path_settings)

    if utils.file_exists(lsp_path_settings) then
        -- load json string
        local fileSettings = io.open(lsp_path_settings, "r")
        if fileSettings ~= nil then
            project_settings = vim.json.decode(fileSettings:read("*a"))
        end
        utils.log.info("nvimrc settings for: " .. client.name)
        utils.log.info(project_settings[client.name])
    else
        utils.log.trace(path .. ": No .nvimrc found")
    end
    return project_settings
end

local go_to_with_options = function(callback)
    vim.ui.select({ 'never', 'vsplit', 'split', 'tab' }, {
        prompt = "Select jump style:",
        telescope = require("telescope.themes").get_cursor(),
    }, function(selected)
        callback(selected)
    end)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

---return on_attach_function configured based on @param params
-- @param params table
---@return function
M.get = function(params)
    return function(client, bufnr)
        local buf_opts = { noremap = true, silent = false, buffer = bufnr }

        -- load configs from .nvimrc.json
        local ok, project_settings = pcall(get_project_local_settings, client, bufnr)
        if not ok then
            local error = "error: can't decode .nvimrc.json, may it's not a valid json " .. project_settings
            utils.log.error(error)
        end

        -- merge nvim configs params and project settings if exists
        if project_settings ~= nil and project_settings[client.name] ~= nil then
            params = utils.table_concat(params, project_settings[client.name])
        end

        utils.log.info("Merged settings .nvimrc.json): [" .. client.name .. "]" .. vim.inspect(params))

        -- inlay hint default false
        if params.inlay ~= nil and params.inlay then
            utils.log.info('Inlay hints enabled: ' .. client.name)
            vim.lsp.inlay_hint.enable(bufnr, true)
        end

        -- custom shiftwidth
        if params.shiftwidth ~= nil and params.shiftwidth > 0 then
            vim.api.nvim_buf_set_option(bufnr, 'shiftwidth', params.shiftwidth)
        end

        -- format and format on save, default true
        if params.format == nil or params.format then
            client.server_capabilities.documentFormattingProvider = true
            vim.keymap.set('n', '<leader>cf', function() format_callback(params.lsp_client, bufnr, true) end, buf_opts)

            -- save on format support
            create_autocmd_format_on_save(client, bufnr, params.lsp_client);
        end

        -- Disable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf_opts)
        vim.keymap.set('n', '<leader>kk', vim.lsp.buf.signature_help, buf_opts)
        vim.keymap.set('n', 'K', function()
            local diagnostic = get_diagnostic_at_cursor()
            if diagnostic == nil or next(diagnostic) == nil then
                vim.lsp.buf.hover()
            else
                vim.diagnostic.open_float()
            end
        end, buf_opts)


        vim.keymap.set('n', 'gD',
            function() go_to_with_options(function(selected) builtin.lsp_definitions({ jump_type = selected }) end) end,
            buf_opts)

        -- vim.keymap.set('n', 'gd', builtin.lsp_definitions, buf_opts)

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf_opts)


        vim.keymap.set('n', 'gi', builtin.lsp_implementations, buf_opts)

        vim.keymap.set('n', 'gI',
            function() go_to_with_options(function(selected) builtin.lsp_implementations({ jump_type = selected }) end) end,
            buf_opts)

        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, buf_opts)
        vim.keymap.set('n', 'gr', builtin.lsp_references, buf_opts)

        -- vim.keymap.set('n', 'gI', builtin.lsp_incoming_calls, buf_opts)
        vim.keymap.set('n', 'gO', builtin.lsp_outgoing_calls, buf_opts)

        --leader
        if params.code_action == nil or params.code_action then
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, buf_opts)
            vim.keymap.set('v', '<leader>ca', vim.lsp.buf.code_action, buf_opts)
        end

        -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, buf_opts)
        vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, buf_opts)


        if params.rename == nil or params.rename then
            vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename(nil, { name = client.name, bufnr }) end,
                buf_opts)
        end

        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, buf_opts)

        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            buf_opts)

        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, buf_opts)
    end
end


return M
