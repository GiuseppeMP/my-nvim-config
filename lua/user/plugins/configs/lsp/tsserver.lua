local on_attach_options = require("user.plugins.configs.lsp.utils.on_attach_options")
local capabilities_options = require("user.plugins.configs.lsp.utils.capabilities_options")
local lspconfig = require 'lspconfig'

lspconfig.tsserver.setup {
    -- format options delegated to eslint lsp
    on_attach = on_attach_options.get({ format_on_save = false, format = false, lsp_client = 'tsserver' }),
    init_options = { hostInfo = "neovim" },
    capabilities = capabilities_options.default
}
