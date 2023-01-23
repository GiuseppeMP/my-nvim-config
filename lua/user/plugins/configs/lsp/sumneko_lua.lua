local on_attach = require("user.plugins.configs.lsp.defaults_on_attach").on_attach

require("lspconfig").sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = { enable = false },
        },
    },
}
