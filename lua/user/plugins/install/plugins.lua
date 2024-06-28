-- Module that returns the list of the vim plugins that must be installed.
-- Modulo que retorna a lista de vim plugins que precisam ser instalados.
-- You can manage your plugins here, separated from plugin manager.

---equivalent of packer rtp='.'
-----@param plugin any
local lazy_rtp = function(plugin)
    ---@diagnostic disable-next-line: undefined-field
    vim.opt.rtp:append(plugin.dir)
end

local M = {}
local home = os.getenv "HOME"


M.plugins = {


    -- Plugin for snippets in different languages
    -- Plugin de snipptes (~)
    {
        'honza/vim-snippets',
        lazy = true,
        config = lazy_rtp
    },
    {
        'stevearc/vim-vscode-snippets'
    },
    -- Git buffersigns
    -- vim8, neovim async interface

    -- Mason tools, LSPs, Debug Servers
    { 'neovim/nvim-lspconfig',          opt = { inlay_hints = { enabled = true } } },
    { 'mfussenegger/nvim-jdtls' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'mfussenegger/nvim-dap-python' },

    -- dap configs
    { 'rcarriga/nvim-dap-ui' },
    { 'mfussenegger/nvim-dap' },
    { 'jayp0521/mason-nvim-dap.nvim' },

    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    },
    {
        "tiagovla/scope.nvim",
        config = function()
            require('scope').setup {}
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        event = 'VeryLazy',
        config = function()
            require('nvim-dap-virtual-text').setup {}
        end
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
            require("dap-vscode-js").setup({
                node_path = "node",
                debugger_path = home .. '/.config/packages/vscode-js-debug',
                adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
            })

            for _, language in ipairs({ "typescript", "javascript" }) do
                require("dap").configurations[language] = {
                    {
                        {
                            type = "pwa-node",
                            request = "launch",
                            name = "Debug Jest Tests",
                            -- trace = true, -- include debugger info
                            runtimeExecutable = "node",
                            runtimeArgs = {
                                "./node_modules/jest/bin/jest.js",
                                "--runInBand",
                            },
                            rootPath = "${workspaceFolder}",
                            cwd = "${workspaceFolder}",
                            console = "integratedTerminal",
                            internalConsoleOptions = "neverOpen",
                        }
                    }
                }
            end
        end
    },
    {
        'mrcjkb/rustaceanvim',
        tag = '3.15.0', -- Recommended
        -- ft = { 'rust' },
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
    {
        import = "plugins"
    }
}
return M.plugins
