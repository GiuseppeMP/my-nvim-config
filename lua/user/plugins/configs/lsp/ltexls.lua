local on_attach_options = require("user.plugins.configs.lsp.utils.on_attach_options")
local capabilities_options = require("user.plugins.configs.lsp.utils.capabilities_options")
local lspconfig = require 'lspconfig'

lspconfig.ltex.setup {
    on_attach = on_attach_options.get { lsp_client = 'ltex' },
    capabilities = capabilities_options.default,
    settings = {
        ltex = {
            language = { 'en-US', 'pt-BR' },
        }
    }
}
