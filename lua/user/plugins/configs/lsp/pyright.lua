local on_attach_pyright = function(client, bufnr)
    -- default on_attach
    require("user.plugins.configs.lsp.utils.on_attach_options").get { format_on_save = true, format = true, lsp_client =
    'pyright' } (client, bufnr)

    -- pyright extras
    local bufopts = { noremap = true, silent = false, buffer = bufnr }
    vim.keymap.set('n', 'df', ":lua require('dap-python').test_class()<CR>", bufopts)
    vim.keymap.set('n', 'dn', ":lua require('dap-python').test_method()<CR>", bufopts)
end

require('lspconfig').pyright.setup {
    on_attach = on_attach_pyright,
    capabilities = require 'user.plugins.configs.lsp.utils.capabilities_options'.default
}
