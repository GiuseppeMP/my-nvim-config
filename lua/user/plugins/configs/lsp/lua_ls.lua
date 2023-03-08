require("lspconfig").lua_ls.setup {
    on_attach = require("user.plugins.configs.lsp.utils.on_attach_options").default,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = { enable = false },
        },
    },
}
