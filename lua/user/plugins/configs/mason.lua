local on_attach = require("user.plugins.lsp.defaults").on_attach
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "jdtls", "sumneko_lua" }
})


require('lspconfig').pyright.setup{
    on_attach = on_attach
}

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

