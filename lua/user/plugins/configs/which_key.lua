-- pluginswhich
-- telescope
local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local dap_save = require 'user.plugins.configs.dap.save_breakpoints'
local blanket = require 'blanket'

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
-- vim.g.tmux_navigator_no_mappings = 1
-- vim.g.tmux_navigator_save_on_switch = 2

-- rest.vim
-- local rest = require 'rest-nvim'

-- nvimtree
local api = require 'nvim-tree.api'

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
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "  ", -- symbol used between a key and it's label
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
        w = { ':Telescope lsp_dynamic_workspace_symbols<CR>', 'Search Workspace types' },
    },
})

-- debug visual mode
wk.register({ ["<F4>"] = { dapui.eval, 'Debug eval' } }, { mode = 'v' })
wk.register({ ["<C-t>"] = { vim.cmd.ToggleTerm, 'Toggle Term' } }, { mode = { 't', 'n' } })
wk.register({ ["<C-b>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", 'Toggle Term tab' } },
    { mode = { 't', 'n' } })



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
        p = { vim.cmd.PresentingStart, 'Present start' },
        u = { vim.cmd.UndotreeToggle, 'Show undotree' },
        l = { vim.cmd.Lazy, 'Lazy plugin manager' },
        d = { vim.cmd.TroubleToggle, 'Show diagnostics panel' },
        D = { vim.cmd.TodoLocList, 'Show comments diagnostics list' },
        m = { vim.cmd.MarkdownPreview, 'Markdown Preview' },
        a = { function() vim.cmd(":CellularAutomaton make_it_rain") end, 'AFK' },
        z = { telescope.extensions.zoxide.list, 'Show zoxide directories' },
        h = { builtin.highlights, "Highlights" },
        -- a = { rest.run, "Execure nvim rest request under cursor" },
        r = { vim.cmd.SnipRun, 'Run code' },
        v = { vim.cmd.Pastify, 'Paste img' },
        s = {
            name = "Swap Buffer",
            h = { function() require("swap-buffers").swap_buffers("h") end, "Swap left" },
            l = { function() require("swap-buffers").swap_buffers("l") end, "Swap right" },
            j = { function() require("swap-buffers").swap_buffers("j") end, "Swap down" },
            k = { function() require("swap-buffers").swap_buffers("k") end, "Swap up" },
        },
        j = {
            name = "Jacoco coverage",
            t = { blanket.stop, 'Coverage blanket terminate' },
            s = { blanket.start, 'Coverage blanket start' },
            r = { blanket.refresh, 'Coverage blanket refresh' },
        },
        g = {
            name = "Git",
            j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
            k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
            b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
            p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
            r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
            R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
            s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
            u = {
                "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                "Undo Stage Hunk",
            },
            o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
            -- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
            c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
            h = {
                "<cmd>DiffviewFileHistory % <cr>", "File history",
            },
            l = {
                "<cmd>DiffviewFileHistory <cr>", "Git history",
            },
            d = {
                "<cmd>Gitsigns diffthis HEAD<cr>", "Diff",
            },
        },
    },
})

-- [<leader>j] - jupyter+
wk.register({
    ["<leader>j"] = {
        name = "Jupyter Notebooks",
        a = { vim.cmd.JupyniumStartAndAttachToServer, 'Start and attach to Jupynium server' },
        f = {
            function()
                local filename_wo_ext = vim.fn.expand "%:t:r:r"
                filename_wo_ext = filename_wo_ext .. '.ipynb'
                vim.cmd.JupyniumStartSync(filename_wo_ext)
            end,
            'Open Jupyter Notebook and start to sync'
        },
    }
}, { mode = 'n' })

wk.register({
    ["<leader>uc"] =
    { function() vim.cmd(":CarbonNow") end, 'Create code snippet image' }
}, { mode = 'v' })

wk.register({
    ["<leader>ur"] =
    { function() require 'sniprun'.run('v') end, 'Run code' }
}, { mode = 'v' })

-- [<leader>h] - harpoon+
wk.register({
    ["<leader>h"] = {
        name = "harpoon, hop",
        a = { harpoon.mark.add_file, 'Harpoon add mark file' },
        h = { hop.hint_words, 'Hop words' },
        l = { tsht.nodes, 'Hop syntax' },
        m = { harpoon.ui.toggle_quick_menu, 'Harpoon quick menu' },
    },
}, { mode = 'n' })


-- [<C-x>] - harpoon fast nav
wk.register({
    ['<C-f>']     = { harpoon.ui.toggle_quick_menu, 'Harpoon quick menu' },
    ['<C-g>']     = { function() harpoon.ui.nav_next() end, 'Go to harpoon next' },
    ['<C-q>']     = { function() harpoon.ui.nav_prev() end, 'Go to harpoon previous' },
    ['<C-1>']     = { function() harpoon.ui.nav_file(1) end, 'Go to harpoon mark 1' },
    ['<C-2>']     = { function() harpoon.ui.nav_file(2) end, 'Go to harpoon mark 2' },
    ['<C-3>']     = { function() harpoon.ui.nav_file(3) end, 'Go to harpoon mark 3' },
    ['<C-4>']     = { function() harpoon.ui.nav_file(4) end, 'Go to harpoon mark 4' },
    ['<C-5>']     = { function() harpoon.ui.nav_file(5) end, 'Go to harpoon mark 5' },
    ['<C-6>']     = { function() harpoon.ui.nav_file(6) end, 'Go to harpoon mark 6' },
    ['<C-7>']     = { function() harpoon.ui.nav_file(7) end, 'Go to harpoon mark 7' },
    ['<C-8>']     = { function() harpoon.ui.nav_file(8) end, 'Go to harpoon mark 8' },
    ['<C-9>']     = { function() harpoon.ui.nav_file(9) end, 'Go to harpoon mark 9' },
    ["<C-Up>"]    = { function() require("swap-buffers").swap_buffers("k") end, "Swap up" },
    ["<C-Down>"]  = { function() require("swap-buffers").swap_buffers("j") end, "Swap down" },
    ["<C-Left>"]  = { function() require("swap-buffers").swap_buffers("h") end, "Swap left" },
    ["<C-Right>"] = { function() require("swap-buffers").swap_buffers("l") end, "Swap right" },
}, { mode = 'n', 'i', 'v' })

wk.register({
    ["<leader>h"] = {
        name = "harpoon, hop",
        l = { tsht.nodes, 'Hop syntax' },
    },
}, { mode = { 'o', 'v' } })

vim.cmd([[
    let g:test#preserve_screen = 0
]])

wk.register({
    ["<leader>t"] = {
        name = "tests",
        m = { function() vim.cmd(":TestNearest") end, 'Run nearest method with vim-test' },
        c = { function() vim.cmd(":TestFile -strategy=toggleterm") end, 'Run class/file tests with vim-test' },
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
    ['<C-s>'] = { vim.cmd.write, 'Save buffer' },
}, { mode = { 't', 'n', 'i' } })


wk.register({
    ["<leader>e"] = { vim.cmd.NvimTreeToggle, 'File explorer' },
    ["<leader>D"] = { 'Type definitions' },
    ["<leader>k"] = { 'Signature help' },
    ["<leader>xw"] = { "SWAP help", 'Swap two words separated by space' },
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
    ["gC"] = { function() require("treesitter-context").go_to_context() end, 'Go to context' },
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
    ["<Tab>"] = { vim.diagnostic.goto_next, "Go to previous lsp diagnostics." },
    ["<S-Tab>"] = { vim.diagnostic.goto_prev, "Go to next lsp diagnostics." }
}, { mode = { "n" } })


-- wk.register({
--     ["<leader>d"] = {
--         h = { vim.cmd(":set statusline=%{synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')}"),
--             "Status line highlight cursor debug" }
--     }
-- })

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
    ["<D-p>"] = { vim.cmd.ChatGPT, 'ChatGPT Prompt' },
    ["<D-s>"] = { vim.cmd.write, 'Write' },
}, { mode = { 'i', 'n', 'v', 't' } })

wk.register({
    c = {
        name = "ChatGPT",
        -- p = { vim.cmd.ChatGPT, "ChatGPT Prompt" },
        c = { "<cmd>ChatGPT<CR>", "ChatGPT Prompt" },
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
    m = {
        r = { "<cmd>CellularAutomaton make_it_rain<CR>", 'Make it rain! Perf your terminal' }
    }
}, {
    prefix = "<leader>",
    mode = { "v", "n" },
})

-- -- tmux
-- wk.register({
--     ["<C-k>"] = { vim.cmd.TmuxNavigateUp, 'Tmux navigate up' },
--     ["<C-j>"] = { vim.cmd.TmuxNavigateDown, 'Tmux navigate down' },
--     ["<C-h>"] = { vim.cmd.TmuxNavigateLeft, 'Tmux navigate left' },
--     ["<C-l>"] = { vim.cmd.TmuxNavigateRight, 'Tmux navigate right' },
--     ["<C-e>"] = { vim.cmd.NvimTreeFindFile, 'NvimTree Focus file' },
--     ["<leader>a"] = { 'ggVG', 'Select all lines' },
-- })

-- spectre
wk.register({
    ["<leader>sw"] = { function() require("spectre").open_visual({ select_word = true }) end, 'Search current word' },
    ["<leader>sP"] = { function() require("spectre").open() end, 'Open Spectre' },
    ["<leader>sd"] = { function() require("persistence").stop() end, "Don't save current session" },
    ["<leader>sl"] = { function() require("persistence").load() end, 'Restore Session' },
    ["<leader>sL"] = { function() require("persistence").load({ last = true }) end, 'Restore last session' },
    ["<leader>sp"] = { function() require("spectre").open_file_search({ select_word = true }) end,
        'Search on current file' },
}, { mode = { "n" }
})

wk.register({
    ["<leader>sw"] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', 'Open Spectre' },
}, { mode = { "v" } })


local telescope_reload = require 'user.plugins.configs.telescope_reload'

wk.register({ ["<leader>sr"] = { telescope_reload.reload, 'Reload lua modules.' } })

local new_note = function()
    local day_folder = os.date("Journals/%Y/%m-%B/%d-%a/%F-%a-note-")
    vim.cmd("ObsidianNew " .. day_folder .. vim.fn.input("Name: ") .. '.md')
    vim.cmd("ObsidianTemplate")
end

local function escape_magic(pattern)
    return (pattern:gsub("%W", "%%%1"))
end

local get_path_note_under_cursor = function()
    local path = api.tree.get_node_under_cursor().absolute_path

    if path then
        -- replace absolute_path for empty
        path = path:gsub(escape_magic(vim.fn.getcwd() .. "/"), "")

        -- replace filename for empty in case of buffer focusing
        path = path:gsub(escape_magic(vim.fn.expand "%:t"), "")

        return path
    end

    return ''
end

local new_blank_note = function()
    local path = api.tree.get_node_under_cursor().absolute_path

    if path then
        -- replace absolute_path for empty
        path = path:gsub(escape_magic(vim.fn.getcwd() .. "/"), "")

        -- replace filename for empty in case of buffer focusing
        path = path:gsub(escape_magic(vim.fn.expand "%:t"), "")

        -- create obsidian note in the current nvimtree path
        vim.cmd("ObsidianNew " .. path .. '/' .. vim.fn.input("Name: ") .. '.md')
    end
end

local today_note = function()
    os.execute('mkdir -p ' .. os.date("Journals/%Y/%m-%B/%d-%a"))
    vim.cmd.ObsidianToday()
end

wk.register({
    ['<leader>o'] = {
        name = 'Obsidian',
        t = { vim.cmd.ObsidianTomorrow, 'Obsidian tomorrow note' },
        d = { today_note, 'Obsidian daily note' },
        y = { vim.cmd.ObsidianYesterday, 'Obsidian yesterday note' },
        c = { vim.cmd.ObsidianTemplate, 'Complete with template' },
        o = { vim.cmd.ObsidianOpen, 'Obsidian open note' },
        f = { vim.cmd.ObsidianQuickSwitch, 'Jump to another note' },
        s = { vim.cmd.ObsidianSearch, 'Search in notes' },
        n = { new_note, 'Obsidian new note from template' },
        p = { function()
            vim.cmd("ObsidianPasteImg " ..
                get_path_note_under_cursor() .. '/' .. vim.fn.input("Image Name: "))
        end, 'Obsidian paste image in folder' },
        P = { function()
            vim.cmd("ObsidianPasteImg " .. vim.fn.input("Image Name: "))
        end, 'Obsidian paste image' },
        b = { new_blank_note, 'Obsidian new blank note' },
    }
})
