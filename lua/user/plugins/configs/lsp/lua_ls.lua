require("lspconfig").lua_ls.setup {
    on_attach = require("user.plugins.configs.lsp.defaults_on_attach"),
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = { enable = false },
        },
    },
}
