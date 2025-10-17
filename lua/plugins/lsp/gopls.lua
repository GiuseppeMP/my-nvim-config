local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")

vim.lsp.config('gopls', {
    on_attach = on_attach_options.get { lsp_client = 'gopls' },
    capabilities = capabilities_options.default
})
