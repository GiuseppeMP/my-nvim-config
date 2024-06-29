local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")
local lspconfig = require 'lspconfig'

lspconfig.marksman.setup {
    on_attach = on_attach_options.get { lsp_client = 'marksman' },
    capabilities = capabilities_options.default
}
