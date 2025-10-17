local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")

vim.lsp.config('html', {
    on_attach = on_attach_options.get { lsp_client = 'html' },
    capabilities = capabilities_options.default
})
