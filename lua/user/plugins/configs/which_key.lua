-- plugins
-- telescope
local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local dap_save = require 'user.plugins.configs.dap.save_breakpoints'

-- nvim/hop
local hop = require('hop')
local tsht = require('tsht')

-- harpoon
local harpoon = {}
harpoon.mark, harpoon.ui = require 'harpoon.mark', require 'harpoon.ui'

-- dap
local dap, dapui = require 'dap', require 'dapui'

-- which_key conf
local wk = require 'which-key'

-- neotest
local neotest = require 'neotest'

-- tmux navigator
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 2

local conf = {
    show_help = false,
    show_keys = false,
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
        k = { builtin.keymaps, "Oh Yeah, the awesome Keymaps!" },
        g = { builtin.git_files, "Git files" },
        d = { builtin.diagnostics, "Diagnostics" },
        m = { function() vim.cmd(":Noice telescope") end, "Noice messages" },
        s = { function() builtin.grep_string({ search = vim.fn.input("Greg > ") }) end, 'Search ...' },
        v = { function() require 'neoclip.fzf' () end, 'Clipboard history' },
        t = { vim.cmd.OverseerRun, 'Show tasks' },
        o = { vim.cmd.OverseerOpen, 'Show tasks output' },
        q = { builtin.quickfix, 'Quickfix' },
        c = { vim.cmd.Noice, 'Noice console messages' },
    },
})

-- debug visual mode
wk.register({ ["<F4>"] = { dapui.eval, 'Debug eval' } }, { mode = 'v' })
wk.register({ ["<C-t>"] = { vim.cmd.ToggleTerm, 'Toggle Term' } }, { mode = { 't', 'n' } })

-- debug normal mode
wk.register({
    ["<F1>"] = { function() dap.toggle_breakpoint() end, 'Debug toggle breakpoint' },
    ["<F2>"] = { function()
        dap.list_breakpoints()
        pcall(dap_save.store_breakpoints, false)
    end, 'List and save breakpoints' },
    ["<F3>"] = { function()
        dap.clear_breakpoints()
        pcall(dap_save.store_breakpoints, true)
    end, 'Clear all breakpoints' },
    ["<F5>"] = { dap.continue, 'Debug continue or attach' },
    ["<F6>"] = { dap.step_into, 'Debug step into' },
    ["<F7>"] = { dap.step_out, 'Debug step out' },
    ["<F8>"] = { dap.step_over, 'Debug step over' },
    ["<F9>"] = { dap.run_last, 'Debug run last' },
}, { 'n', 'i', 'v' })

-- [<leader>u] - utils
wk.register({
    ["<leader>u"] = {
        name = "utils",
        t = { vim.cmd.TagbarToggle, 'Toggle tagbar' },
        u = { vim.cmd.UndotreeToggle, 'Show undotree' },
        l = { vim.cmd.Lazy, 'Lazy plugin manager' },
        d = { vim.cmd.TroubleToggle, 'Show diagnostics panel' },
        -- m = { vim.cmd.MarkdownPreview, 'Markdown Preview' },
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
    ['<M-s>'] = { vim.cmd.write, 'Save buffer' },
}, { mode = { 't', 'n', 'i' } })


wk.register({
    ["<leader>e"] = { vim.cmd.NvimTreeToggle, 'File explorer' },
    ["<leader>D"] = { 'Type definitions' },
    ["<leader>k"] = { 'Signature help' },
    ["<leader>xw"] = { "wbdf elp", 'Swap two words separated by space' },
    ["<leader>rn"] = { 'Rename' },
    ["K"] = { 'Lsp hover hints' },
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
    ["gs"] = { vim.cmd.G, "Source control" },
    ["gc"] = { "Comment" },
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



wk.register({
    ["<leader>d"] = {
        h = { vim.cmd(":set statusline=%{synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')}"),
            "Status line highlight cursor debug" }
    }
})

-- codeium
wk.register({
    ["<c-;>"] = { function() vim.fn['codeium#Complete']() end, 'Codeium trigger suggestion' },
    ["<c-,>"] = { function() vim.fn['codeium#CycleCompletions'](1) end, 'Codeium next suggestion' },
    ["<c-.>"] = { function() vim.fn['codeium#CycleCompletions'](-1) end, 'Codeium previous suggestion' },
}, { mode = { 'i' } })

wk.register({
    ["<c-y>"] = 'Codeium accept suggestion',
    ["<c-/>"] = { function() vim.fn['codeium#Clear']() end, 'Codeium clear' },
}, { mode = { 'i', 'n' } })

vim.cmd [[
     imap <script><silent><nowait><expr> <C-y> codeium#Accept()
 ]]

-- chat-gpt
wk.register({
    ["<C-p>"] = { vim.cmd.ChatGPT, 'ChatGPT Prompt' },
}, { mode = { 'i', 'n', 'v', 't' } })

wk.register({
    c = {
        name = "ChatGPT",
        p = { vim.cmd.ChatGPT, "ChatGPT Prompt" },
        e = { vim.cmd.ChatGPTEditWithInstruction, "Edit with instruction" },
        g = { function() vim.cmd.ChatGPTRun("grammar_correction") end, "Grammar Correction" },
        k = { function() vim.cmd.ChatGPTRun("keywords") end, "Keywords" },
        d = { function() vim.cmd.ChatGPTRun("docstring") end, "Docstring" },
        o = { function() vim.cmd.ChatGPTRun("optimize_code") end, "Optimize Code" },
        s = { function() vim.cmd.ChatGPTRun("summarize") end, "Summarize" },
        b = { function() vim.cmd.ChatGPTRun("fix_bugs") end, "Fix Bugs" },
        x = { function() vim.cmd.ChatGPTRun("explain_code") end, "Explain Code" },
        r = { function() vim.cmd.ChatGPTRun("roxygen_edit") end, "Roxygen Edit" },
        l = { function() vim.cmd.ChatGPTRun("code_readability_analysis") end, "Code Readability Analysis" },
        t = { function() vim.cmd.ChatGPTRun("translate") end, "Translate" },
        i = { vim.cmd.ChatGPTActAs, "Impersonate, Act as.." },
        tt = { function() vim.cmd.ChatGPTRun("add_tests") end, "Add Tests" },
    },
}, {
    prefix = "<leader>",
    mode = { "v", "n" },
})

-- tmux
wk.register({
    ["<C-k>"] = { vim.cmd.TmuxNavigateUp, 'Tmux navigate up' },
    ["<C-j>"] = { vim.cmd.TmuxNavigateDown, 'Tmux navigate down' },
    ["<C-h>"] = { vim.cmd.TmuxNavigateLeft, 'Tmux navigate left' },
    ["<C-l>"] = { vim.cmd.TmuxNavigateRight, 'Tmux navigate right' },
    ["<C-s>"] = { 'ggVG', 'Select all lines' },
})

-- spectre
wk.register({
    ["<leader>S"] = { function() require("spectre").open() end, 'Open Spectre' },
    ["<leader>sw"] = { function() require("spectre").open_visual({ select_word = true }) end, 'Search current word' },
    ["<leader>sp"] = { function() require("spectre").open_file_search({ select_word = true }) end,
        'Search on current file' },
}, { mode = { "n" }
})

wk.register({
    ["<leader>sw"] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', 'Open Spectre' },
}, { mode = { "v" } })
