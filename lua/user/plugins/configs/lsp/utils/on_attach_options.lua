local M = {}

local format_callback = function()
    vim.lsp.buf.format { async = false }
end

M.with_format = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd({ "FileWritePre", "BufWritePre" }, {
            group = vim.api.nvim_create_augroup("format_lsp_attach", { clear = true }),
            buffer = bufnr,
            callback = format_callback
        })
    end
end

M.get = function(params)
    return function(client, bufnr)
        local buf_opts = { noremap = true, silent = false, buffer = bufnr }

        -- formatOnSave default true
        if params.formatOnSave == nil or params.formatOnSave then
            M.with_format(client, bufnr);
        end

        -- format default true
        if params.format == nil or params.format then
            vim.keymap.set('n', '<leader>cf', format_callback, buf_opts)
        end

        -- Disable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buf_opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf_opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf_opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf_opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, buf_opts)

        --leader
        if params.code_action == nil or params.code_action then
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, buf_opts)
        end
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, buf_opts)
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, buf_opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, buf_opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, buf_opts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        buf_opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, buf_opts)
    end
end


-- lsp default on_attach
M.default = M.get { format = true, formatOnSave = true }

local border = {
    { "🭽", "FloatBorder" },
    { "▔",  "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕",  "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁",  "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏",  "FloatBorder" },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

return M
