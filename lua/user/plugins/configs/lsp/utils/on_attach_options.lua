local M = {}

local builtin = require 'telescope.builtin'

local format_callback = function(lsp_client, bufnr, async)
    vim.lsp.buf.format {
        buffer = bufnr,
        async = async,
        filter = function(client)
            return client.name == lsp_client
        end
    }
end

local create_autocmd_format_on_save = function(client, bufnr, lsp_client)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd({ "FileWritePre", "BufWritePre" }, {
            group = vim.api.nvim_create_augroup("format_lsp_attach", { clear = true }),
            buffer = bufnr,
            callback = function() format_callback(lsp_client, bufnr, false) end
        })
    end
end

M.get = function(params)
    return function(client, bufnr)
        local buf_opts = { noremap = true, silent = false, buffer = bufnr }

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

        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf_opts)
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, buf_opts)
        --
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf_opts)

        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf_opts)
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, buf_opts)

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
