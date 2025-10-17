local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")


vim.lsp.config('terraformls', {
    on_attach = on_attach_options.get { lsp_client = 'terraformls' },
    capabilities = capabilities_options.default
})
