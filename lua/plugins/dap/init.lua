local home = os.getenv "HOME"
local function config()
    require 'plugins.dap.dap_setup'
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
            require('nvim-dap-virtual-text').setup {
                highlight_changed_variables = true,
                highlight_new_as_changed = false,
                virt_text_pos = 'inline',
                commented = true,        -- prefix virtual text with comment string
                show_stop_reason = true, -- show stop reason when stopped for exceptions
                all_frames = true,       -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                virt_lines = false,      -- show virtual lines instead of virtual text (will flicker!)
                virt_text_win_col = 80,
                display_callback = function(variable, _buf, _stackframe, _node, _options)
                    local name = variable.name
                    local value = variable.value

                    local function mask_secret(val)
                        if #val > 5 then
                            return name .. " " .. val:sub(1, 3) .. string.rep("*", #val - 5) .. val:sub(-2)
                        else
                            return name .. ' ' .. val
                        end
                    end

                    local secret_patterns = {
                        "[Pp]assword",
                        "[Ss]ecret",
                        "[Tt]oken",
                        "[Kk]ey",
                        "[Cc]redential",
                        "[Aa]uth",
                        ".*_pw",
                        ".*_key",
                        ".*_secret",
                        ".*token.*"
                    }

                    for _, pattern in ipairs(secret_patterns) do
                        if name:match(pattern) then
                            return name .. " = " .. mask_secret(value)
                        end
                    end

                    -- Truncate long values
                    local max_len = 160
                    if #value > max_len then
                        value = value:sub(1, max_len) .. "..."
                    end
                    return name .. ' = ' .. value:gsub("%s+", " ")

                    -- return name .. " = " .. value
                end,
            }
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
