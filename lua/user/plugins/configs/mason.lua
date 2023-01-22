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

-- require("mason-lspconfig").setup({
--     ensure_installed = { "pyright", "jdtls", "sumneko_lua" }
-- })

require('mason-tool-installer').setup {

  -- a list of all tools you want to ensure are installed upon
  -- start; they should be the names Mason uses for each tool
  ensure_installed = {
    { 'jdtls', auto_update = true },
    { 'pyright', auto_update = true },
    { 'lua-language-server', auto_update = true },
    { 'stylua', auto_update = true}
  },

  -- if set to true this will check each tool for updates. If updates
  -- are available the tool will be updated. This setting does not
  -- affect :MasonToolsUpdate or :MasonToolsInstall.
  -- Default: false
  auto_update = false,

  -- automatically install / update on startup. If set to false nothing
  -- will happen on startup. You can use :MasonToolsInstall or
  -- :MasonToolsUpdate to install tools and check for updates.
  -- Default: true
  run_on_start = true,

  -- set a delay (in ms) before the installation starts. This is only
  -- effective if run_on_start is set to true.
  -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
  -- Default: 0
  start_delay = 3000, -- 3 second delay
}


-- if these configs over extends, move to lsp/ folder.
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


require('mason-nvim-dap').setup({
    ensure_installed = { "python", "delve", "javadbg", "javatest" },
    automatic_setup = true,
    automatic_installation = true,
})



