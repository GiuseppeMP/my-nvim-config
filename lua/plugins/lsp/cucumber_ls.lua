local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")
local lspconfig = require 'lspconfig'

-- lspconfig.cucumber_language_server.setup {
--     on_attach = on_attach_options.get { lsp_client = 'cucumber-language-server' },
--     capabilities = capabilities_options.default
-- }
