-- plugins
-- telescope
local telescope = require 'telescope'
local builtin = require 'telescope.builtin'

-- nvim/hop
local hop = require('hop')
local tsht = require('tsht')

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
        border = "double",   -- none, single, double, shadow
        position = "bottom", -- bottom, top
    },
    layout = {
        spacing = 8, -- spacing between columns
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    icons = {
        breadcrumb = "»",                  -- symbol used in the command line area that shows your active key combo
        separator = "  ",                -- symbol used between a key and it's label
        -- group = "+",       -- symbol prepended to a group
        group = conf.icons.git.added .. ' ' -- symbol prepended to a group
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
        name = "fuzzy finder/telescope",
        f = { builtin.find_files, 'Find files' },
        r = { builtin.oldfiles, "Open recent file" },
        n = { "<cmd>enew<cr>", "New file" },
        l = { builtin.live_grep, "Live grep" },
        b = { builtin.buffers, "Buffers" },
        h = { builtin.help_tags, "Help tags" },
        g = { builtin.git_files, "Git files" },
        d = { builtin.diagnostics, "Diagnostics" },
        m = { function() vim.cmd(":Telescope harpoon marks") end, "Harpoon marks" },
        s = { function() builtin.grep_string({ search = vim.fn.input("Greg > ") }) end, 'Search ...' },
        v = { function() require 'neoclip.fzf' () end, 'Clipboard history' },
        t = { vim.cmd.OverseerRun, 'Show tasks' },
        o = { vim.cmd.OverseerOpen, 'Show tasks output' },
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

-- [<leader>u] - utils
wk.register({
    ["<leader>u"] = {
        name = "utils",
        t = { vim.cmd.TagbarToggle, 'Toggle tagbar' },
        u = { vim.cmd.UndotreeToggle, 'Show undotree' },
        l = { vim.cmd.Lazy, 'Lazy plugin manager' },
        d = { vim.cmd.TroubleToggle, 'Show diagnostics panel' },
        m = { vim.cmd.MarkdownPreview, 'Markdown Preview' },
        z = { telescope.extensions.zoxide.list, 'Show zoxide directories' },
    },
})

wk.register({ ["<leader>uc"] = { function() vim.cmd(":CarbonNow") end, 'Create code snippet image' } }, { mode = 'v' })

-- [<leader>h] - harpoon+
wk.register({
    ["<leader>h"] = {
        name = "harpoon, hop",
        a = { harpoon.mark.add_file, 'Harpoon add mark file' },
        h = { hop.hint_words, 'Hop words' },
        l = { tsht.nodes, 'Hop syntax' },
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
}, { mode = 'n' })

wk.register({
    ["<leader>h"] = {
        name = "harpoon, hop",
        l = { tsht.nodes, 'Hop syntax' },
    },
}, { mode = { 'o', 'v' } })


wk.register({
    ["<leader>t"] = {
        name = "tests",
        t = { function() neotest.run.run() end, 'Run nearest test' },
        d = { function() neotest.run.run({ strategy = 'dap' }) end, 'Debug nearest test' },
        f = { function() neotest.run.run(vim.fn.expand('%')) end, 'Run all tests in the file' },
        s = { function() neotest.summary.toggle() end, 'Toggle tests summary' },
        o = { function() neotest.output_panel.toggle() end, 'Toggle tests output window' },
        a = { function() neotest.run.run({ suite = true }) end, 'Run all tests' },
        -- e = { function() neotest.diagnostic() end, 'Show tests diagnostics' },
    },
})

wk.register({
    ["<leader>c"] = {
        name = "code",
        a = { 'Code actions' },
        f = { 'Code format' },
    }
})

wk.register({
    ['<M-l>'] = { function() nvterm.terminal.toggle 'vertical' end, 'Toggle vertical terminal' },
    ['<M-j>'] = { function() nvterm.terminal.toggle 'horizontal' end, 'Toggle horizontal terminal' },
    ['<M-f>'] = { function() nvterm.terminal.toggle 'float' end, 'Toggle float terminal' },
    ['<M-s>'] = { vim.cmd.write, 'Save buffer' },
}, { mode = { 't', 'n', 'i' } })


wk.register({
    ["<leader>e"] = { vim.cmd.NvimTreeToggle, 'File explorer' },
    ["<leader>D"] = { 'Type definitions' },
    ["<leader>k"] = { 'Signature help' },
    ["<leader>xw"] = { "wbdf elp", 'Swap two words separated by space' },
    ["<leader>rn"] = { 'Rename' },
    ["K"] = { 'Lsp hover' },
    ["<leader>q"] = { vim.cmd.Bdelete, 'Buffer delete' }
})

wk.register({
    ["d"] = {
        f = { 'Debug file' },
        n = { 'Debug nearest test' },
    }
})

wk.register({
    ["<leader>w"] = {
        name = "workspace",
        a = { 'Add workspace folder' },
        r = { 'Remove workspace folder' },
        l = { 'List workspace folders' },
    }
})

-- [g] goto+
wk.register({
    ["gd"] = { "Go to definition" },
    ["gD"] = { "Go to declaration" },
    ["gi"] = { "Go to implementation" },
    ["gr"] = { "Go to references" },
    ["ga"] = { function()
        vim.cmd(":w")
        vim.cmd(":A")
    end, 'Go to tests (Alternate)' },
    ["gs"] = { vim.cmd.G, "Go to references" },
    ["gc"] = { "Comment.." },
})

-- [m] marks+
wk.register({
    ["m"] = {
        name = "marks",
    },
})

wk.register({
    ["z"] = {
        name = "folding",
        R = { require('ufo').openAllFolds, 'Open all foldings' },
        M = { require('ufo').closeAllFolds, 'Close all foldings' },
        r = { require('ufo').openFoldsExecptKinds, 'Open folding except kinds' },
        m = { require('ufo').closeFoldsWith, 'Close folds with' },
    },
})

-- tmux navigator
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 2
wk.register({
    ["<C-k>"] = { vim.cmd.TmuxNavigateUp, 'Tmux navigate up' },
    ["<C-j>"] = { vim.cmd.TmuxNavigateDown, 'Tmux navigate down' },
    ["<C-h>"] = { vim.cmd.TmuxNavigateLeft, 'Tmux navigate left' },
    ["<C-l>"] = { vim.cmd.TmuxNavigateRight, 'Tmux navigate right' },
})



wk.register({
    ["<leader>d"] = {
        h = { vim.cmd(":set statusline=%{synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')}"),
            "Status line highlight cursor debug" }
    }
})
