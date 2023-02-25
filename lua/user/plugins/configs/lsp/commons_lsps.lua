local on_attach = require("user.plugins.configs.lsp.defaults_on_attach")

require("lspconfig").lemminx.setup { on_attach = on_attach }

require("lspconfig").html.setup { on_attach = on_attach }
