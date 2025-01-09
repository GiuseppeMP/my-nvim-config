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

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end



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
            elements = {
                -- Elements can be strings or table with id and size keys.
                "breakpoints",
                { id = "scopes", size = 0.25 },
                "watches",
                "stacks",
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
    controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = true,
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
        indent = 1,
        max_value_lines = 100
    }
})

require 'plugins.dap.java'
require 'plugins.dap.python'
require 'plugins.dap.js'
require 'plugins.dap.cpp'
