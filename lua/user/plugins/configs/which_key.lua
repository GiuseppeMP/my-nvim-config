vim.g.which_key_timeout = 300

-- plugins
-- telescope
local builtin = require 'telescope.builtin'

-- chad/nvterm
local nvterm = {}
nvterm.terminal = require 'nvterm.terminal'

-- harpoon
local harpoon = {}
harpoon.mark, harpoon.ui = require 'harpoon.mark', require 'harpoon.ui'

-- dap
local dap, dapui = require 'dap', require 'dapui'

-- which_key conf
local wk = require 'which-key'

-- neotest
local neotest = require 'neotest'

local conf = {
    ignore_missing = true,
    window = {
        border = "double", -- none, single, double, shadow
        position = "bottom", -- bottom, top
    },
    layout = {
        spacing = 6, -- spacing between columns
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "  ", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

wk.setup(conf)

-- mappings

-- [<leader>f] - fzf+
wk.register({
    ["<leader>f"] = {
        name = "fuzzy finder",
        f = { builtin.find_files, 'Find files' },
        r = { builtin.oldfiles, "Open recent file" },
        n = { "<cmd>enew<cr>", "New file" },
        l = { builtin.live_grep, "Live grep" },
        b = { builtin.buffers, "Buffers" },
        h = { builtin.help_tags, "Help tags" },
        g = { builtin.git_files, "Git files" },
        d = { builtin.diagnostics, "Diagnostics" },
        m = { function() vim.cmd(":Telescope harpoon marks") end, "Harpoon marks" },
        s = { function() builtin.grep_string({ search = vim.fn.input("Greg > ") }) end, 'Search ...' }
    },
})


-- debug visual mode
wk.register({ ["<F4>"] = { dapui.eval, 'Debug eval' } }, { mode = 'v' })

-- debug normal mode
wk.register({
    ["<F1>"] = { dap.toggle_breakpoint, 'Debug toggle breakpoint' },
    ["<F2>"] = { dap.list_breakpoints, 'Debug toggle breakpoint' },
    ["<F3>"] = { dap.repl.open, 'Debug repl open' },
    ["<F5>"] = { dap.continue, 'Debug continue' },
    ["<F6>"] = { dap.step_into, 'Debug step into' },
    ["<F7>"] = { dap.step_out, 'Debug step out' },
    ["<F8>"] = { dap.step_over, 'Debug step over' },
    ["<F9>"] = { dap.run_last, 'Debug run last' },
})


-- [<leader>h] - harpoon+
wk.register({
    ["<leader>h"] = {
        name = "harpoon",
        a = { harpoon.mark.add_file, 'Harpoon add mark file' },
        m = { harpoon.ui.toggle_quick_menu, 'Harpoon quick menu' },
        ['1'] = { function() harpoon.ui.nav_file(1) end, 'Go to harpoon mark 1' },
        ['2'] = { function() harpoon.ui.nav_file(2) end, 'Go to harpoon mark 2' },
        ['3'] = { function() harpoon.ui.nav_file(3) end, 'Go to harpoon mark 3' },
        ['4'] = { function() harpoon.ui.nav_file(4) end, 'Go to harpoon mark 4' },
        ['5'] = { function() harpoon.ui.nav_file(5) end, 'Go to harpoon mark 5' },
        ['6'] = { function() harpoon.ui.nav_file(6) end, 'Go to harpoon mark 6' },
        ['7'] = { function() harpoon.ui.nav_file(7) end, 'Go to harpoon mark 7' },
        ['8'] = { function() harpoon.ui.nav_file(8) end, 'Go to harpoon mark 8' },
        ['9'] = { function() harpoon.ui.nav_file(9) end, 'Go to harpoon mark 9' },
    },
})

wk.register({
    ["<leader>t"] = {
        name = "tests and terminals",
        t = { function()
            vim.cmd(":w")
            neotest.run.run()
        end, 'Run nearest test' },
        d = { function() neotest.run.run({ strategy = 'dap' }) end, 'Debug nearest test' },
        f = { function() neotest.run.run(vim.fn.expand('%')) end, 'Run all tests in the file' },
        a = { function() neotest.run.run({ suite = true }) end, 'Run all tests' },
    },
})

wk.register({
    ['<A-v>'] = { function() nvterm.terminal.toggle 'vertical' end, 'Toggle vertical terminal' },
    ['<A-s>'] = { function() nvterm.terminal.toggle 'horizontal' end, 'Toggle horizontal terminal' },
    ['<A-f>'] = { function() nvterm.terminal.toggle 'float' end, 'Toggle float terminal' },
}, { mode = { 't', 'n' } })


wk.register({
    ["<leader>e"] = { vim.cmd.NvimTreeToggle, 'Open file explorer' },
    ["<leader>u"] = { vim.cmd.UndotreeToggle, 'Show Undotree' },
})

-- [g] goto+
wk.register({
    ["g"] = {
        name = "goto",
        a = { function()
            vim.cmd(":w")
            vim.cmd(":A")
        end, 'Go to tests (Alternate)' },
        s = { vim.cmd.G, "Go to git status" }
    },
})

-- [m] marks+
wk.register({
    ["m"] = {
        name = "marks",
    },
})
