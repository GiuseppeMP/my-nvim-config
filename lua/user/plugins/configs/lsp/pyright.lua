
local on_attach = require("user.plugins.lsp.defaults_on_attach").on_attach

require('lspconfig').pyright.setup{
    on_attach = on_attach
}
