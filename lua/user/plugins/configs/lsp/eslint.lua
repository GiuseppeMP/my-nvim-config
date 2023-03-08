local lspconfig = require 'lspconfig'

local on_attach_options = require("user.plugins.configs.lsp.utils.on_attach_options")
local capabilities_options = require("user.plugins.configs.lsp.utils.capabilities_options")

lspconfig.eslint.setup {
    on_attach = on_attach_options.default,
    capabilities = capabilities_options.default,
    settings = {
        codeActionOnSave = {
            enable = true,
            mode = "all",
        },
        autoFixOnSave = true,
        format = true
    }
}
