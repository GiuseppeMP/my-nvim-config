-- This module keeps the config of all packages installed by mason:
-- DAPs
-- LSPs
-- Linters
-- Formatters

-- Mason setup
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Mason packages LSPs, Formatters, Linters
require('mason-tool-installer').setup {
    ensure_installed = {
        { 'jdtls', auto_update = true },
        { 'pyright', auto_update = true },
        { 'lua-language-server', auto_update = true },
        { 'stylua', auto_update = true },
        { 'html-lsp' , auto_update = true },
        { 'lemminx', auto_update = true },
    },
    auto_update = false,
    run_on_start = true,
    start_delay = 3000, -- 3 second delay
}

-- Mason packages DAPs with automatic setup
require('mason-nvim-dap').setup({
    ensure_installed = { "python", "delve", "javadbg", "javatest" },
    automatic_setup = true,
    automatic_installation = true,
})
