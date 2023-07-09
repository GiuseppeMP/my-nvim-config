local M = {}

local builtin = require 'telescope.builtin'

local jdtls_save_actions = function()
    require 'jdtls'.organize_imports()
end

local apply_autosave_actions = function(lsp_client, _, _)
    if (string.find(lsp_client, 'jdtls')) then
        jdtls_save_actions()
    end
end

---function format
---@param lsp_client string the name of the lsp_client, eg: jdtls, lua_ls, etc.
---@param bufnr number id of the buffer
---@param async boolean if it'll execute async
local format_callback = function(lsp_client, bufnr, async)
    -- add null_ls formatting support
    local null_ls_formatting_support = { 'pyright' }
    if (utils.table_contains(null_ls_formatting_support, lsp_client)) then
        vim.lsp.buf.format()
    else
        vim.lsp.buf.format {
            buffer = bufnr,
            async = async,
            filter = function(client)
                return client.name == lsp_client
            end
        }
    end

    apply_autosave_actions(lsp_client, bufnr, async)
end



---autocmd to format on save
---@param client any
---@param bufnr number
---@param lsp_client string
local create_autocmd_format_on_save = function(client, bufnr, lsp_client)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd({ "FileWritePre", "BufWritePre" }, {
            group = vim.api.nvim_create_augroup("format_lsp_attach", { clear = true }),
            buffer = bufnr,
            callback = function() format_callback(lsp_client, bufnr, false) end
        })
    end
end

--- return a lua table of the .nvimrc.json at workspace/project folder
---@param client any
---@param _ any
---@return table
local get_project_local_settings = function(client, _)
    -- get client workspace folder
    local path = client.workspace_folders[1].name
    local project_settings = nil

    -- lookup for the .nvimrc.json
    local lsp_path_settings = path .. "/.nvimrc.json"
    if utils.file_exists(lsp_path_settings) then
        -- load json string
        local fileSettings = io.open(lsp_path_settings, "r")
        if fileSettings ~= nil then
            project_settings = vim.json.decode(fileSettings:read("*a"))
        end
    else
        utils.log.trace(path .. ": No .nvimrc.json found")
    end
    --- client name settings, for multiple lsps workspace
    return project_settings
end

---return on_attach_function configured based on @param params
-- @param params table
---@return function
M.get = function(params)
    return function(client, bufnr)
        local buf_opts = { noremap = true, silent = false, buffer = bufnr }

        local ok, project_settings = pcall(get_project_local_settings, client, bufnr)
        if not ok then
            local error = "error: can't decode .nvimrc.json, may it's not a valid json " .. project_settings
            utils.log.error(error)
        end

        -- merge nvim configs params and project settings
        if project_settings ~= nil then
            params = utils.table_concat(params, project_settings[client.name])
        end

        utils.log.info("merged settings (lsp{setup} and .nvimrc.json): " .. vim.inspect(params))

        -- formatOnSave default true
        if params.format_on_save == nil or params.format_on_save then
            client.server_capabilities.documentFormattingProvider = true
            create_autocmd_format_on_save(client, bufnr, params.lsp_client);
        end

        -- format default true
        if params.format == nil or params.format then
            client.server_capabilities.documentFormattingProvider = true
            vim.keymap.set('n', '<leader>cf', function() format_callback(params.lsp_client, bufnr, true) end, buf_opts)
        end

        -- Disable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buf_opts)

        vim.keymap.set('n', 'gd', function() builtin.lsp_definitions({ jump_style = 'vsplit'}) end, buf_opts)
        --
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf_opts)

        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf_opts)
        vim.keymap.set('n', 'gi', function () builtin.lsp_implementations({jump_style = 'vsplit'}) end, buf_opts)

        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, buf_opts)
        vim.keymap.set('n', 'gr', builtin.lsp_references, buf_opts)

        vim.keymap.set('n', 'gI', builtin.lsp_incoming_calls, buf_opts)
        vim.keymap.set('n', 'gO', builtin.lsp_outgoing_calls, buf_opts)

        --leader
        if params.code_action == nil or params.code_action then
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, buf_opts)
        end

        -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, buf_opts)
        vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, buf_opts)

        vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, buf_opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, buf_opts)

        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, buf_opts)

        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            buf_opts)

        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, buf_opts)
    end
end


return M
