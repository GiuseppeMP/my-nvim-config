---@diagnostic disable: inject-field
local dap, dapui = require("dap"), require("dapui")
local tokyo_colors = require("tokyonight.colors").setup()
local icons = require 'user.icons'

tokyo_colors.vgreen = '#0db9d7'

vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })
vim.api.nvim_set_hl(0, "red", { fg = "#BD2031" })

vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = tokyo_colors.vgreen, bg = "#291c17" })

-- Dap Icons.
vim.fn.sign_define('DapBreakpointCondition', {
    text = icons.diagnostics.question,
    texthl = 'blue',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})

vim.fn.sign_define('DapBreakpointRejected', {
    text = icons.diagnostics.error,
    texthl = 'orange',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})

vim.fn.sign_define('DapStopped', { text = '', texthl = "DapStopped", linehl = 'DapStopped', numhl = 'DapStopped' })

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'red', linehl = '', numhl = '' })

vim.cmd [[vnoremap <leader>de <Cmd>lua require("dapui").eval()<CR>]]

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--     ---@diagnostic disable-next-line: undefined-field
--     _G.dapui.current_win = vim.api.nvim_get_current_win()
--     ---@diagnostic disable-next-line: undefined-field
--     vim.cmd.NvimTreeClose()
--     dapui.open()
-- end
--
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--     dapui.close()
--     ---@diagnostic disable-next-line: undefined-field
--     vim.api.nvim_set_current_win(_G.dapui.current_win)
--     ---@diagnostic disable-next-line: undefined-field
--     vim.cmd.NvimTreeToggle()
-- end
--
-- dap.listeners.before.event_exited["dapui_config"] = function()
--     dapui.close()
--     ---@diagnostic disable-next-line: undefined-field
--     vim.api.nvim_set_current_win(_G.dapui.current_win)
--     ---@diagnostic disable-next-line: undefined-field
--     vim.cmd.NvimTreeToggle()
-- end

-- dap.listeners.before.attach.dapui_config = function(event)
--     -- dapui.open()
--     vim.cmd("DapViewOpen")
-- end
-- dap.listeners.before.launch.dapui_config = function(event)
--     vim.cmd("DapViewOpen")
-- end
-- dap.listeners.before.event_terminated.dapui_config = function(event)
--     -- dapui.close()
--     vim.cmd("DapViewClose")
--     -- print(vim.inspect(event))
--     -- if event.exitCode == 0 then
--     --     vim.notify("Debug terminated")
--     --     -- dapui.close()
--     --     vim.cmd("DapViewClose")
--     -- end
-- end
-- dap.listeners.before.event_exited.dapui_config = function(event)
--     vim.cmd("DapViewClose")
--     -- if event.exitCode == 0 then
--     --     vim.notify("Tests passed")
--     --     -- dapui.close()
--     --     vim.cmd("DapViewClose")
--     -- end
-- end


require("dapui").setup({
    force_buffers = true,
    icons = { expanded = "", collapsed = "", current_frame = "" },
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Use this to override mappings for specific elements
    element_mappings = {
        stacks = {
            open = "<CR>",
            expand = "o",
        }
    },
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    layouts = {
        {
            -- Left panel: Watches only
            elements = {
                -- { id = "scopes", size = 0.5 },
            },
            size = 45, -- width in columns
            position = "left",
        },
    },
    controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = false,
        -- Display controls in this element
        element = "repl",
        icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
        },
    },
    floating = {
        max_height = 0.8,  -- These can be integers or a float between 0 and 1.
        max_width = 0.8,   -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    render = {
        indent = 3,
        max_value_lines = nil,
        format = function(value, variable)
            local max_visible = 40

            -- Define your regex pattern to match secret-like variable names
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
                ".*token.*",
                ".*pass.*",
                ".*Bearer.*"
            }

            local function is_secret(name)
                for _, pattern in ipairs(secret_patterns) do
                    if name:match(pattern) then
                        return true
                    end
                end
                return false
            end

            -- Mask if variable name matches secret pattern
            if is_secret(variable.name) and type(value) == "string" and #value > 5 then
                local first = value:sub(1, 3)
                local last = value:sub(-2)
                local masked = string.rep("*", #value - 5)
                return first .. masked .. last
            end

            -- Truncate if too long
            if type(value) == "string" and #value > max_visible then
                return value:sub(1, max_visible) .. "...]>"
            end

            return value
        end,
    }
})

require 'plugins.dap.java'
require 'plugins.dap.python'
require 'plugins.dap.js'
require 'plugins.dap.cpp'
