
local on_attach_pyright = function(_client, bufnr)
    -- default on_attach
    require("user.plugins.configs.lsp.defaults_on_attach")(_client, bufnr)

    -- pyright extras
    local bufopts = { noremap=true, silent=false, buffer=bufnr }
    vim.keymap.set('n', 'df', ":lua require('dap-python').test_class()<CR>", bufopts)
    vim.keymap.set('n', 'dn', ":lua require('dap-python').test_method()<CR>", bufopts)
end

require('lspconfig').pyright.setup{
    on_attach = on_attach_pyright
}
