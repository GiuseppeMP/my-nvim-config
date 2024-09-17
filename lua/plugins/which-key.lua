local function config()
    -- TODO: check if this is still needed
    vim.cmd([[
        let g:test#preserve_screen = 0
    ]])
    -- pluginswhich
    -- telescope
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local dap_save = require 'plugins.dap.save_breakpoints'
    local blanket = require 'blanket'

    -- nvim/hop
    local hop = require('hop')
    local tsht = require('tsht')

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
        preset = 'modern',
        presets = {
            operators = true,
            motions = false,
            text_objects = true,
            windows = true,
            nav = false,
            z = true,
            g = false
        },
        delay = 1000,
    }

    wk.setup(conf)

    wk.add({
        -- normal mode
        {
            { "<leader>f",  group = "fzf/telescope+" },
            { "<leader>ff", builtin.find_files,                                              desc = 'Find files' },
            { "<leader>fr", builtin.oldfiles,                                                desc = "Open recent file" },
            { "<leader>fn", "<cmd>enew<cr>",                                                 desc = "New file" },
            { "<leader>fl", builtin.live_grep,                                               desc = "Live grep" },
            { "<leader>fb", builtin.buffers,                                                 desc = "Buffers" },
            { "<leader>fh", builtin.help_tags,                                               desc = "Help tags" },
            { "<leader>fk", builtin.keymaps,                                                 desc = "Oh Yeah, the awesome Keymaps!" },
            { "<leader>fg", builtin.git_files,                                               desc = "Git files" },
            { "<leader>fd", builtin.diagnostics,                                             desc = "Diagnostics" },
            { "<leader>fm", function() vim.cmd(":Noice telescope") end,                      desc = "Noice messages" },
            -- { "<leader>fs", function() builtin.grep_string({ search = vim.fn.input("Greg > ") }) end, desc = 'Search ...' },
            { "<leader>fs", function() vim.cmd(":Telescope live_grep use_regex=true") end,   desc = 'Search ...' },
            { "<leader>fg", function() vim.cmd(":Telescope grep_string use_regex=true") end, desc = 'Search ...' },
            { "<leader>fv", function() vim.cmd(":Telescope neoclip") end,                    desc = 'ctrl/cmd-[v]' },
            { "<leader>ft", vim.cmd.OverseerRun,                                             desc = 'Show tasks' },
            { "<leader>fo", vim.cmd.OverseerOpen,                                            desc = 'Show tasks output' },
            { "<leader>fq", builtin.quickfix,                                                desc = 'Quickfix' },
            { "<leader>fc", vim.cmd.Noice,                                                   desc = 'Noice console messages' },
            { "<leader>fw", ':Telescope lsp_dynamic_workspace_symbols<CR>',                  desc = 'Search Workspace types' },
        },
        -- normal and terminal mode
        {
            mode = { 'n', 't', 'i' },
            { "<C-t>", vim.cmd.ToggleTerm, desc = 'Toggle Term' },
        },
        -- normal, insert and visual mode
        {
            mode = { 'n', 'i', 'v' },
            { "<F1>", function() dap.toggle_breakpoint() end, desc = 'Debug toggle breakpoint' },
            {
                "<F2>",
                function()
                    dap.list_breakpoints()
                    pcall(dap_save.store_breakpoints, false)
                end,
                desc = 'List and save breakpoints'
            },
            {
                "<F3>",
                function()
                    dap.clear_breakpoints()
                    pcall(dap_save.store_breakpoints, true)
                end,
                desc = 'Clear all breakpoints'
            },
            { "<F4>", dapui.eval,                             desc = 'Debug eval' },
            { "<F5>", dap.continue,                           desc = 'Debug continue or attach' },
            { "<F6>", dap.step_into,                          desc = 'Debug step into' },
            { "<F7>", dap.step_out,                           desc = 'Debug step out' },
            { "<F8>", dap.step_over,                          desc = 'Debug step over' },
            { "<F9>", dap.run_last,                           desc = 'Debug run last' },
        },
    })
    -- [<leader>u] - utils
    wk.add({
        { "<leader>u",   group = "utils" },
        { '<leader>t',   vim.cmd.TagbarToggle,                                      desc = 'Toggle tagbar' },
        { '<leader>p',   vim.cmd.PresentingStart,                                   desc = 'Present start' },
        { '<leader>uu',  vim.cmd.UndotreeToggle,                                    desc = 'Show undotree' },
        { '<leader>ul',  vim.cmd.Lazy,                                              desc = 'Lazy plugin manager' },
        { '<leader>ud',  function() vim.cmd('Trouble diagnostics toggle') end,      desc = 'Show diagnostics panel' },
        { '<leader>uD',  vim.cmd.TodoLocList,                                       desc = 'Show comments diagnostics list' },
        { '<leader>um',  vim.cmd.MarkdownPreview,                                   desc = 'Markdown Preview' },
        { '<leader>ua',  function() vim.cmd(":CellularAutomaton make_it_rain") end, desc = 'AFK' },
        { '<leader>uz',  telescope.extensions.zoxide.list,                          desc = 'Show zoxide directories' },
        { '<leader>uh',  builtin.highlights,                                        desc = "Highlights" },
        -- { '<leader>ua',  rest.run,                                                         desc = "Execure nvim rest request under cursor" },
        { '<leader>ur',  vim.cmd.SnipRun,                                           desc = 'Run code' },
        { '<leader>uv',  vim.cmd.Pastify,                                           desc = 'Paste img' },
        { '<leader>us',  group = "Swap Buffer" },
        { '<leader>ush', function() require("swap-buffers").swap_buffers("h") end,  desc = "Swap left" },
        { '<leader>usl', function() require("swap-buffers").swap_buffers("l") end,  desc = "Swap right" },
        { '<leader>usj', function() require("swap-buffers").swap_buffers("j") end,  desc = "Swap down" },
        { '<leader>usk', function() require("swap-buffers").swap_buffers("k") end,  desc = "Swap up" },
        { '<leader>uj',  group = "Jacoco coverage" },
        { '<leader>ujt', blanket.stop,                                              desc = 'Coverage blanket terminate' },
        { '<leader>ujs', blanket.start,                                             desc = 'Coverage blanket start' },
        { '<leader>ujr', blanket.refresh,                                           desc = 'Coverage blanket refresh' },
        { '<leader>g',   group = "Git" },
        { '<leader>ugj', "<cmd>lua require 'gitsigns'.next_hunk()<cr>",             desc = "Next Hunk" },
        { '<leader>ugk', "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",             desc = "Prev Hunk" },
        { '<leader>ugb', "<cmd>lua require 'gitsigns'.blame_line()<cr>",            desc = "Blame" },
        { '<leader>ugp', "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",          desc = "Preview Hunk" },
        { '<leader>ugr', "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",            desc = "Reset Hunk" },
        { '<leader>ugR', "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",          desc = "Reset Buffer" },
        { '<leader>ugs', "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",            desc = "Stage Hunk" },
        { '<leader>ugu', "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",       desc = "Undo Stage Hunk", },
        { '<leader>ugo', "<cmd>Telescope git_status<cr>",                           desc = "Open changed file" },
        { '<leader>ugc', "<cmd>Telescope git_commits<cr>",                          desc = "Checkout commit" },
        { '<leader>ugh', "<cmd>DiffviewFileHistory % <cr>",                         desc = "File history", },
        { '<leader>ugl', "<cmd>DiffviewFileHistory <cr>",                           desc = "Git history", },
        { '<leader>ugd', "<cmd>Gitsigns diffthis HEAD<cr>",                         desc = "Diff", },
        {
            mode = { 'v' },
            { "<leader>uc", function() vim.cmd(":CarbonNow") end,      desc = 'Create code snippet image' },
            { "<leader>ur", function() require 'sniprun'.run('v') end, desc = 'Run code' }
        }
    })

    wk.add({
        { "<leader>j",  group = "Jupyter Notebooks" },
        { '<leader>ja', vim.cmd.JupyniumStartAndAttachToServer, desc = 'Start and attach to Jupynium server' },
        {
            '<leader>jf',
            function()
                local filename_wo_ext = vim.fn.expand "%:t:r:r"
                filename_wo_ext = filename_wo_ext .. '.ipynb'
                vim.cmd.JupyniumStartSync(filename_wo_ext)
            end,
            desc = 'Open Jupyter Notebook and start to sync'
        },
    })
    local harpoon = require("harpoon")

    -- [<leader>h] - harpoon+
    wk.add({
        { "<leader>h",  group = "harpoon, hop" },
        { '<leader>ha', function() harpoon:list():add() end, desc = 'Harpoon add mark file' },
        { '<leader>hh', hop.hint_words,                      desc = 'Hop words' },
        { '<leader>hl', tsht.nodes,                          desc = 'Hop syntax' },
    })

    -- [<C-x>] - harpoon fast nav
    wk.add({
        { mode = { 'n', 'i', 'v' } },
        -- { '<C-g>',                 function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Open harpoon menu' },
        { '<C-e>',                 function() harpoon:list():next() end,                     desc = 'Go to harpoon next' },
        { '<C-q>',                 function() harpoon:list():prev() end,                     desc = 'Go to harpoon prev' },
        { '<leader>1',             function() harpoon:list():select(1) end,                  desc = 'Go to harpoon mark 1' },
        { '<leader>2',             function() harpoon:list():select(2) end,                  desc = 'Go to harpoon mark 2' },
        { '<leader>3',             function() harpoon:list():select(3) end,                  desc = 'Go to harpoon mark 3' },
        { '<leader>4',             function() harpoon:list():select(4) end,                  desc = 'Go to harpoon mark 4' },
        { '<leader>5',             function() harpoon:list():select(5) end,                  desc = 'Go to harpoon mark 5' },
        { '<leader>6',             function() harpoon:list():select(6) end,                  desc = 'Go to harpoon mark 6' },
        { '<leader>7',             function() harpoon:list():select(7) end,                  desc = 'Go to harpoon mark 7' },
        { '<leader>8',             function() harpoon:list():select(8) end,                  desc = 'Go to harpoon mark 8' },
        { '<leader>9',             function() harpoon:list():select(9) end,                  desc = 'Go to harpoon mark 9' },
        { "<C-Up",                 function() require("swap-buffers").swap_buffers("k") end, desc = "Swap up" },
        { "<C-Down>",              function() require("swap-buffers").swap_buffers("j") end, desc = "Swap down" },
        { "<C-Left>",              function() require("swap-buffers").swap_buffers("h") end, desc = "Swap left" },
        { "<C-Right>",             function() require("swap-buffers").swap_buffers("l") end, desc = "Swap right" },
    })


    local function is_vim_test()
        local vimtest_list = { "python" }
        return vim.tbl_contains(vimtest_list, vim.bo.filetype)
    end

    local function test_nearest()
        if (is_vim_test) then
            vim.cmd(":TestNearest")
        else
            neotest.run.run()
        end
    end
    local function test_file()
        if (is_vim_test) then
            vim.cmd(":TestFile")
        else
            neotest.run.run(vim.fn.expand('%'))
        end
    end
    local function test_class()
        if (is_vim_test) then
            vim.cmd(":TestClass")
        else
            neotest.run.run(vim.fn.expand('%'))
        end
    end
    local function test_suite()
        if (is_vim_test) then
            vim.cmd(":TestSuite")
        else
            neotest.run.run({ suite = true })
        end
    end

    wk.add({
        { "<leader>t",  group = "[t]esting" },
        { "<leader>tt", test_nearest,                                         desc = 'Run nearest [t]est' },
        { "<leader>tc", test_class,                                           desc = 'Run [c]lasstests with vim-test' },
        { "<leader>tf", test_file,                                            desc = 'Run [f]ile test' },
        { "<leader>ta", test_suite,                                           desc = 'Run [s]uite tests' },
        { "<leader>td", function() neotest.run.run({ strategy = 'dap' }) end, desc = '[d]ebug nearest test' },
        { "<leader>ts", function() neotest.summary.toggle() end,              desc = 'Toggle tests [s]ummary' },
        { "<leader>to", function() neotest.output_panel.toggle() end,         desc = 'Toggle tests [o]utput window' },
    })

    wk.add({
        { "<leader>c",  group = "code" },
        { "<leader>ca", desc = 'Code actions' },
        { "<leader>cf", desc = 'Code format' },
    })

    vim.keymap.set("i", "<C-s>", function() vim.cmd("silent write") end, { silent = true })
    vim.keymap.set("n", "<C-s>", function() vim.cmd("silent write") end, { silent = true })

    wk.add({
        { "<C-f>",      vim.cmd.NvimTreeFocus,                                  desc = 'Focus file' },
        { "<leader>e",  vim.cmd.NvimTreeToggle,                                 desc = 'File explorer' },
        { "<leader>D",  desc = 'Type definitions' },
        { "<leader>k",  desc = 'Signature help' },
        { "<leader>xw", desc = 'Swap two words separated by space' },
        { "<leader>rn", desc = 'Rename' },
        { "K",          desc = 'Lsp hover hints' },
        { "<leader>q",  vim.cmd.Bdelete,                                        desc = 'Buffer delete' },
        { "<leader>Q",  function() require('bufdelete').bufdelete(0, true) end, desc = 'Buffer delete' },
        { "df",         desc = 'Debug File Tests' },
        { "dn",         desc = 'Debug Nearest Test' },
    })

    wk.add({
        { "<leader>w",  desc = "workspace" },
        { "<leader>wa", desc = 'Add workspace folder' },
        { "<leader>wr", desc = 'Remove workspace folder' },
        { "<leader>wl", desc = 'List workspace folders' },
    })

    vim.keymap.set("v", ";;", ":fold<CR>", { silent = true })
    vim.keymap.set("n", ";;", "zA", { silent = true })

    -- [g] goto+
    wk.add({
        { "gd", desc = "Go to definition" },
        { "gD", desc = "Go to declaration" },
        { "gi", desc = "Go to implementation" },
        { "gu", desc = "Go to usages/references" },
        {
            "gA",
            function()
                vim.cmd(":w")
                vim.cmd(":AS")
            end,
            desc = 'split [A]lternate'
        },
        {
            "ga",
            function()
                vim.cmd(":w")
                vim.cmd(":A")
            end,
            desc = 'buffer [a]lternate'
        },
        { "gs", vim.cmd.G,                                                    desc = "[s]ource control" },
        { "gC", function() require("treesitter-context").go_to_context() end, desc = 'Go to [C]ontext' },
    })

    wk.add({
        { "z",   group = 'folding' },
        { "zVR", require('ufo').openAllFolds,         desc = 'Open all foldings' },
        { "zM",  require('ufo').closeAllFolds,        desc = 'Close all foldings' },
        { "zr",  require('ufo').openFoldsExceptKinds, desc = 'Open folding except kinds' },
        { "zm",  require('ufo').closeFoldsWith,       desc = 'Close folds with' }
    })


    wk.add({
        {
            "<leader>dd",
            function()
                vim.diagnostic.open_float()
            end,
            desc = "Open float [d]iagnostic"
        },
        {
            "<leader>dn",
            function()
                vim.diagnostic.goto_next()
                vim.diagnostic.open_float()
            end,
            desc = "Go to [n]ext lsp diagnostic."
        },
        {
            "<leader>dp",
            function()
                vim.diagnostic.goto_prev()
                vim.diagnostic.open_float()
            end,
            desc = "Go to [p]revious diagnostic."
        },
        {
            "]d",
            function()
                vim.diagnostic.goto_next()
                vim.diagnostic.open_float()
            end,
            desc = "Go to next lsp diagnostics."
        },
        {
            "[d",
            function()
                vim.diagnostic.goto_prev()
                vim.diagnostic.open_float()
            end,
            desc = "Go to previous lsp diagnostics."
        },
        { "<Tab>", '<c-i>', desc = "Jump foward" },
    })


    -- wk.add({
    --     ["<leader>d"] = {
    --         h = { vim.cmd(":set statusline=%{synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')}"),
    --             "Status line highlight cursor debug" }
    --     }
    -- })

    -- codeium
    wk.add({
        mode = { 'i' },
        { "<c-;>", function() vim.fn['codeium#Complete']() end,           desc = 'Codeium trigger suggestion' },
        { "<c-,>", function() vim.fn['codeium#CycleCompletions'](1) end,  desc = 'Codeium next suggestion' },
        { "<c-.>", function() vim.fn['codeium#CycleCompletions'](-1) end, desc = 'Codeium previous suggestion' },
    })

    wk.add({
        {
            mode = { 'i', 'n' },
            { "<c-y>", desc = 'Codeium accept suggestion' },
            { "<c-/>", function() vim.fn['codeium#Clear']() end, desc = 'Codeium clear' },
        }
    })

    vim.cmd [[ imap <script><silent><nowait><expr> <C-y> codeium#Accept() ]]

    -- chat-gpt
    wk.add({
        {
            mode = { 'i', 'n', 'v', 't' },
            { "<D-p>", vim.cmd.ChatGPT, desc = 'ChatGPT Prompt' },
            { "<D-s>", vim.cmd.write,   desc = 'Write' },
        }
    })

    wk.add({
        {
            mode = { "v", "n" },
            { "<leader>c",  group = "ChatGPT" },
            { "<leader>cc", "<cmd>ChatGPT<CR>",                                             desc = "ChatGPT Prompt" },
            { "<leader>ce", vim.cmd.ChatGPTEditWithInstruction,                             desc = "Edit with instruction" },
            { "<leader>cg", function() vim.cmd.ChatGPTRun("grammar_correction") end,        desc = "Grammar Correction" },
            { "<leader>ck", function() vim.cmd.ChatGPTRun("keywords") end,                  desc = "Keywords" },
            { "<leader>cd", function() vim.cmd.ChatGPTRun("docstring") end,                 desc = "Docstring" },
            { "<leader>co", function() vim.cmd.ChatGPTRun("optimize_code") end,             desc = "Optimize Code" },
            { "<leader>cz", function() vim.cmd.ChatGPTRun("summarize") end,                 desc = "Summarize" },
            { "<leader>cb", function() vim.cmd.ChatGPTRun("fix_bugs") end,                  desc = "Fix Bugs" },
            { "<leader>cx", function() vim.cmd.ChatGPTRun("explain_code") end,              desc = "Explain Code" },
            { "<leader>cr", function() vim.cmd.ChatGPTRun("roxygen_edit") end,              desc = "Roxygen Edit" },
            { "<leader>cl", function() vim.cmd.ChatGPTRun("code_readability_analysis") end, desc = "Code Readability Analysis" },
            { "<leader>ct", function() vim.cmd.ChatGPTRun("translate") end,                 desc = "Translate" },
            { "<leader>ci", vim.cmd.ChatGPTActAs,                                           desc = "Impersonate, Act as.." },
            { "<leader>cu", function() vim.cmd.ChatGPTRun("add_tests") end,                 desc = "Add Unit Tests" },
            { "<leader>cs", function() vim.cmd.ChatGPTRun("show_tests") end,                desc = "Show Tests" },
        },
    })

    -- <leader>s
    wk.add({
            { "<leader>s",  group = "Search and Replace & Session Management", },

            { "<leader>sa", vim.cmd.Alpha,                                                              desc = 'Session [a]lpha' },
            { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end,      desc = 'Search selected [w]ord' },
            { "<leader>sr", '<cmd>lua require("spectre").toggle()<CR>',                                 desc = 'Search & [r]eplace' },
            -- TODO: sf not working
            { "<leader>sf", function() require("spectre").open_file_search({ select_word = true }) end, desc = 'Search on current [f]ile' },

            { "<leader>sc", function() require("persistence").select() end,                             desc = 'Session [c]hange' },
            { "<leader>sd", function() require("persistence").stop() end,                               desc = "Session [d]isconnect" },
            { "<leader>sl", function() require("persistence").load() end,                               desc = 'Session [l]oad' },
            { "<leader>sL", function() require("persistence").load({ last = true }) end,                desc = 'Session [L]ast' },
            { "<leader>sR", require 'user.utils.telescope_reload'.reload,                               desc = 'Session [R]eload configs' }
        },
        {
            mode = { "v", "s", "x" },
            { "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', desc = 'Search selected [w]ord' },
        })




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
    local execute_current_line = function()
        local line = vim.fn.getline(".")
        vim.cmd("lua " .. line)
    end
    wk.add({
        { '<leader>l',  group = 'Lua utils' },
        { '<leader>lr', execute_current_line, desc = 'Execute curent line.' },
    })

    wk.add({
        { '<leader>OO', "<esc>A,<esc>O",             desc = 'Add a comma at the end of the line and create a new line above' },
        { '<leader>o',  group = 'Obsidian' },
        { "<leader>ot", vim.cmd.ObsidianTomorrow,    desc = 'Obsidian tomorrow note' },
        { "<leader>od", today_note,                  desc = 'Obsidian daily note' },
        { "<leader>oy", vim.cmd.ObsidianYesterday,   desc = 'Obsidian yesterday note' },
        { "<leader>oc", vim.cmd.ObsidianTemplate,    desc = 'Complete with template' },
        { "<leader>oo", "<esc>A,<esc>o",             desc = 'Add a comma at the end of the line and create a new line below' },
        { "<leader>of", vim.cmd.ObsidianQuickSwitch, desc = 'Jump to another note' },
        { "<leader>os", vim.cmd.ObsidianSearch,      desc = 'Search in notes' },
        { "<leader>on", new_note,                    desc = 'Obsidian new note from template' },
        {
            "<leader>op",
            function()
                vim.cmd("ObsidianPasteImg " .. get_path_note_under_cursor() .. '/' .. vim.fn.input("Image Name: "))
            end,
            desc = 'Obsidian paste image in folder'
        },
        {
            "<leader>oP",
            function()
                vim.cmd("ObsidianPasteImg " .. vim.fn.input("Image Name: "))
            end,
            desc = 'Obsidian paste image'
        },
        { "<leader>cb", new_blank_note, desc = 'Obsidian new blank note' },
    })
end
return {
    { "folke/which-key.nvim", config = config }
}
