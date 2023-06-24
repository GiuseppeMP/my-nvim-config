-- This module keeps the dap and dapui general
-- configurations
local dap, dapui = require("dap"), require("dapui")
local tokyo_colors = require("tokyonight.colors").setup()

vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })
vim.api.nvim_set_hl(0, "red", { fg = "#BD2031" })

vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = tokyo_colors.yellow, bg = tokyo_colors.black })

-- Dap Icons.
vim.fn.sign_define('DapBreakpointCondition', {
    text = '',
    texthl = 'blue',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})

vim.fn.sign_define('DapBreakpointRejected', {
    text = '',
    texthl = 'orange',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})


-- vim.fn.sign_define('DapStopped', { text = 'ﴫ', texthl = 'green', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
-- vim.fn.sign_define('DapLogPoint', { text = '󰀨', texthl = 'yellow', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
-- vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'red', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
-- vim.fn.sign_define('DapStopped', { text = '', texthl = 'red', linehl = 'DapStopped', numhl = 'DapStopped' })


vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = 'DapStopped', numhl = 'DapStopped' })

vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })

vim.cmd [[vnoremap <leader>de <Cmd>lua require("dapui").eval()<CR>]]

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end


require("dapui").setup({
    icons = { expanded = "", collapsed = "", current_frame = "" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Use this to override mappings for specific elements
    element_mappings = {
        -- Example:
        -- stacks = {
        --   open = "<CR>",
        --   expand = "o",
        -- }
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                "breakpoints",
                { id = "scopes", size = 0.25 },
                "watches",
                -- "stacks",
            },
            size = 50, -- 40 columns
            position = "left",
        },
        {
            elements = {
                -- "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
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
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
    }
})

require 'user.plugins.configs.dap.java'
require 'user.plugins.configs.dap.python'
