local home = os.getenv "HOME"
local function config()
    require 'plugins.dap.setup_dap'
end

return {
    { 'mfussenegger/nvim-dap',       config = config },
    { 'rcarriga/nvim-dap-ui' },
    { 'mfussenegger/nvim-dap-python' },
    { 'jayp0521/mason-nvim-dap.nvim' },
    {
        "theHamsta/nvim-dap-virtual-text",
        event = 'VeryLazy',
        config = function()
            require('nvim-dap-virtual-text').setup {}
        end
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = { 'mfussenegger/nvim-dap' },
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
}
