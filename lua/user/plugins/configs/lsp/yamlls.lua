local on_attach_options = require("user.plugins.configs.lsp.utils.on_attach_options")
local capabilities_options = require("user.plugins.configs.lsp.utils.capabilities_options")
local lspconfig = require 'lspconfig'

lspconfig.yamlls.setup {
    -- format options delegated to eslint lsp
    on_attach = on_attach_options.get({ format_on_save = false, format = false, lsp_client = 'yamlls' }),
    capabilities = capabilities_options.default,
    settings = {
        redhat = {
            telemetry = {
                enabled = false
            }
        }
    }
}
