local function config()
    require('mason').setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })

    require('mason-tool-installer').setup {
        ensure_installed = {
            -- lsps
            { 'jdtls',                           auto_update = false },
            { 'groovyls',                        auto_update = false },
            { 'npm-groovy-lint',                 auto_update = false },
            { 'pyright',                         auto_update = false },
            { 'lua-language-server',             auto_update = false },
            { 'stylua',                          auto_update = false },
            { 'html-lsp',                        auto_update = false },
            { 'lemminx',                         auto_update = false },
            { 'typescript-language-server',      auto_update = false },
            { 'eslint-lsp',                      auto_update = false },
            { 'yaml-language-server',            auto_update = false },
            { 'ansible-language-server',         auto_update = false },
            { 'json-lsp',                        auto_update = false },
            { 'css-lsp',                         auto_update = false },
            { 'docker-compose-language-service', auto_update = false },
            { 'dockerfile-language-server',      auto_update = false },
            { 'gopls',                           auto_update = false },
            { 'terraform-ls',                    auto_update = false },
            { 'clangd',                          auto_update = false },
            -- linters
            { 'proselint',                       auto_update = false },
            { 'ltex-ls',                         auto_update = false },
            { 'taplo',                           auto_update = false },
            { 'marksman',                        auto_update = false },
            { 'flake8',                          auto_update = false },
            { 'autopep8',                        auto_update = false },
            { 'pydocstyle',                      auto_update = false },
            { 'pylint',                          auto_update = false },
            -- { 'eslint_d',                        auto_update = false },
            -- formatters
            { 'google-java-format',              auto_update = false },
            -- debuggers
            { 'chrome-debug-adapter',            auto_update = true },
            { 'cucumber-language-server',        auto_update = true },
        },
        auto_update = true,
        run_on_start = true,
        start_delay = 3000, -- 3 second delay
    }

    require('mason-nvim-dap').setup({
        ensure_installed = { "python", "delve", "javadbg", "javatest" },
        automatic_setup = true,
        automatic_installation = true,
    })

    require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer" },
    }
end
return {
    {
        'williamboman/mason.nvim',
        config = config,
        dependencies = { 'williamboman/mason-lspconfig.nvim', 'WhoIsSethDaniel/mason-tool-installer.nvim' }
    }

}
