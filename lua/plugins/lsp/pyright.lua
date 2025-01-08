local on_attach_pyright = function(client, bufnr)
    -- default on_attach
    require("plugins.lsp.utils.on_attach_options").get { format_on_save = true, format = true, lsp_client =
    'pyright' } (client, bufnr)

    vim.cmd [[
        nnoremap <silent> dn :lua require('dap-python').test_method()<CR>
        nnoremap <silent> df :lua require('dap-python').test_class()<CR>
        vnoremap <silent> ds <ESC>:lua require('dap-python').debug_selection()<CR>
    ]]
end

require('lspconfig').pyright.setup {
    on_attach = on_attach_pyright,
    capabilities = require 'plugins.lsp.utils.capabilities_options'.default,
    filetypes = { "python" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                extraPaths = { "./src" }
            }
        }
    }
}
