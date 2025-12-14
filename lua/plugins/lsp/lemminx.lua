local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")

vim.lsp.config('lemminx', {
    on_attach = on_attach_options.get { lsp_client = 'lemminx' },
    capabilities = capabilities_options.default,
})
vim.lsp.enable("lemminx")
