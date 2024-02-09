-- Module that returns the list of the vim plugins that must be installed.
-- Modulo que retorna a lista de vim plugins que precisam ser instalados.
-- You can manage your plugins here, separated from plugin manager.

---equivalent of packer rtp='.'
-----@param plugin any
local lazy_rtp = function(plugin)
    ---@diagnostic disable-next-line: undefined-field
    vim.opt.rtp:append(plugin.dir)
end

local M = {}
local home = os.getenv "HOME"

vim.g.tagbar_left = 1

M.plugins = {

    -- Repeat plugins cmds using dot command
    -- Repetir os cmds dos plugins usando ponto
    { 'tpope/vim-repeat' },

    -- Powerline fonts for VIM
    -- Fonts powerline para VIM
    { 'powerline/powerline-fonts' },

    -- Fast comments using gcc or v(selection) gcc
    -- Comentarios rapidos atraves de gcc ou v(selecao)gcc
    { "tpope/vim-commentary" },

    -- parser, formatter, better syntax highlight
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'VeryLazy'
    },

    -- text objects treesitter
    { 'nvim-treesitter/nvim-treesitter-textobjects' },

    -- text objects improved by subjects
    { 'RRethy/nvim-treesitter-textsubjects',         event = 'VeryLazy' },

    -- refactor module for tresitter
    { 'nvim-treesitter/nvim-treesitter-refactor',    event = 'VeryLazy' },

    -- comment string for multiple languages in the same buffer
    { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'VeryLazy' },

    -- better context, for long functions
    {
        'romgrk/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup({
                -- enable = true,           -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
                -- min_window_height = 0,   -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                -- line_numbers = true,
                multiline_threshold = 5, -- Maximum number of lines to show for a single context
                -- trim_scope = 'outer',    -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                -- mode = 'cursor',         -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                -- separator = nil,
                -- zindex = 20,     -- The Z-index of the context window
                -- on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            })
        end
    },

    -- auto close and auto rename xml, htmls tags
    { 'windwp/nvim-ts-autotag' },

    -- Rainbow in Treesitter
    -- { 'HiPhish/nvim-ts-rainbow2',                    event = 'VeryLazy' },
    { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim', event = 'VeryLazy' },

    -- close buffers without exit vim or messing layouts
    { 'moll/vim-bbye' },

    -- Plugin for buffers as tabs
    {
        'akinsho/bufferline.nvim',
        -- enabled = false,
        version = '*'
    },
    { 'windwp/windline.nvim',         config = function() require('user.plugins.configs.windline') end },

    -- Plugins for VIM :colorscheme collections
    { 'rafi/awesome-vim-colorschemes' },
    { 'artanikin/vim-synthwave84' },
    { 'ryanoasis/vim-devicons' },
    { 'Mofiqul/dracula.nvim' },

    {
        "folke/tokyonight.nvim",
        config = function()
            require('tokyonight').setup({
                style = 'moon',
                transparent = true,
                transparent_sidebar = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "transparent", -- style for sidebars, see below
                    floats = "transparent",   -- style for floating windows
                },
            })
        end
    },

    -- Git commands cli by :G (command)
    -- Interface git atraves de :G (comando)
    { 'tpope/vim-fugitive' },

    -- Fuzzy finder written in lua
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2'
    },

    -- Tagbar outline
    {
        'preservim/tagbar'
    },

    -- Collection of plugins for tests, Debug and TDD
    { 'nvim-lua/plenary.nvim', },
    { 'vim-test/vim-test',     branch = 'master' },
    {
        'nvim-neotest/neotest',
        dependencies = {
            'andy-bell101/neotest-java',
            'nvim-neotest/neotest-jest'
        },
    },
    { 'nvim-neotest/neotest-vim-test', },
    { 'nvim-neotest/neotest-plenary', },
    -- vim tests
    { 'kana/vim-vspec', },
    -- fix cursor in tests/debug
    { 'antoinemadec/FixCursorHold.nvim' },
    -- go to test file (alernate)
    { 'tpope/vim-projectionist',        event = 'VeryLazy' },

    --Plug for mark files and terminals on the fly, to avoid repeat commands like
    --bnext, bprev, or fzf
    { 'ThePrimeagen/harpoon' },

    -- Plug for float windows like fzf but for anything and vim-test
    -- Plugin para utilizar janelas flutuantes parecido com fzf, suportar vim-test
    { 'voldikss/vim-floaterm' },

    -- Plugin for snippets in different languages
    -- Plugin de snipptes (~)
    {
        'honza/vim-snippets',
        lazy = true,
        event = 'VeryLazy',
        config = lazy_rtp
    },

    -- Git buffersigns
    {
        'lewis6991/gitsigns.nvim',
    },

    -- vim8, neovim async interface
    { 'skywind3000/asyncrun.vim' },

    -- vim8, neovim async interface
    { 'lewis6991/async.nvim' },

    -- tmux <-> neovim navigation using C-l,k,j,h
    { 'christoomey/vim-tmux-navigator' },

    { 'iamcco/markdown-preview.nvim',  build = 'cd app && yarn install' },

    -- Markdown preview
    {
        'toppair/peek.nvim',
        config = function() require('peek').setup({}) end
    },

    -- toggle C-a/x custom values
    { 'nat-418/boole.nvim' },

    -- Mason tools, LSPs, Debug Servers
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim', },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', },
    { 'neovim/nvim-lspconfig',                     opt = { inlay_hints = { enabled = true } } },
    { 'mfussenegger/nvim-jdtls' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'mfussenegger/nvim-dap-python' },

    -- dap configs
    { 'rcarriga/nvim-dap-ui' },
    { 'mfussenegger/nvim-dap' },
    { 'jayp0521/mason-nvim-dap.nvim' },

    -- lsp kind icons
    { 'onsails/lspkind.nvim' },


    -- Debug adapter for tests python
    { 'nvim-neotest/neotest-python' },

    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        version = '*',
        lazy = false
    },

    -- startup screen
    {
        'goolord/alpha-nvim',
    },

    -- undo history tree
    { 'mbbill/undotree' },

    -- cmp for autocompletion
    { 'hrsh7th/cmp-nvim-lsp' }, -- lsp completions
    { 'hrsh7th/cmp-buffer' },   -- buffer completions
    { 'hrsh7th/cmp-path' },     -- path completions
    { 'hrsh7th/cmp-cmdline' },  -- cmdline completions
    { 'hrsh7th/nvim-cmp' },     -- completion plugin
    -- cmp vsnip users
    -- {
    --     'hrsh7th/cmp-vsnip',
    --         lazy = false,
    --         config = lazy_rtp
    -- },
    -- {
    --     'hrsh7th/vim-vsnip',
    --         lazy = false,
    --         event = 'VeryLazy',
    --         config = lazy_rtp
    -- },
    -- cmp  luasnip users
    {
        'L3MON4D3/LuaSnip',
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp"
    },
    { 'saadparwaiz1/cmp_luasnip' },
    -- cmp ultisnips users
    -- { 'SirVer/ultisnips' },
    -- { 'quangnguyen30192/cmp-nvim-ultisnips' },
    -- cmp snippy users
    { 'dcampos/nvim-snippy' },
    { 'dcampos/cmp-snippy' },
    -- cmp snippet collections
    { "rafamadriz/friendly-snippets" },

    -- which key
    { "folke/which-key.nvim" },

    -- better lsp progress ui
    -- {
    --     'j-hui/fidget.nvim', lazy = { tag = 'legacy' }
    -- },

    -- better nvim ui
    { 'stevearc/dressing.nvim',      enabled = true, lazy = false, },

    -- clipboard/yank manager
    {
        'AckslD/nvim-neoclip.lua',
        -- event = 'VeryLazy',
        -- enabled = false,
        config = function()
            require 'neoclip'.setup {
                default_register = '+',
                keys = {
                    fzf = {
                        select = 'default',
                        paste = 'p',
                        paste_behind = 'P',
                        custom = {},
                    },
                }
            }
        end,
        dependencies = { 'nvim-telescope/telescope.nvim', 'ibhagwan/fzf-lua', 'kkharji/sqlite.lua' }
    },

    -- better ui for diagnostics
    {
        "folke/trouble.nvim",
        event = 'VeryLazy',
        config = function()
            require 'trouble'.setup { signs = {
                error = conf.signs.error,
                warning = conf.signs.warn,
                hint = conf.signs.hint,
                information = conf.signs.info,
                other = conf.signs.other
            }, }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- better easymotion
    {
        "phaazon/hop.nvim",
        config = function()
            -- using homerow hopping is much confortable and faster
            local querty_home_row = 'asdfghjkl;';
            -- local colemak_dh_home_row = 'arstgmneio';
            require 'hop'.setup({ keys = querty_home_row .. 'woei' })
        end,
        tag = "v2.0.3"
    },

    -- easymotion by syntax hop+treesitter
    { 'mfussenegger/nvim-treehopper' },

    -- better folding (using treesitter, lsp, etc)
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { 'kevinhwang91/promise-async' },
        event = 'VeryLazy',
        config = function()
            vim.o.foldcolumn = '1' -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
            require 'ufo'.setup({
                provider_selector = function(_, _, _)
                    return { 'treesitter', 'indent' }
                end
            })
        end,
    },

    -- zoxide (smart cd) integration
    {
        'jvgrootveld/telescope-zoxide',
        dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
    },

    -- markdown lint/sintax/hi
    {
        'preservim/vim-markdown',
        enabled = false,
        dependencies = { 'godlygeek/tabular' },
        branch = 'master',
        lazy = false,
        ft = "markdown",
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_new_list_item_indent = 1
        end
    },
    {
        'stevearc/overseer.nvim',
    },
    {
        "ellisonleao/carbon-now.nvim",
        cmd = "CarbonNow",
        config = function()
            require('carbon-now').setup(
                { open_cmd = conf.so.is_mac and "open" or "xdg-open" }
            )
        end
    },

    -- AI supports
    ---  copilot + cmp
    {
        "zbirenbaum/copilot-cmp",
        dependencies = "zbirenbaum/copilot.lua",
        cond = function() return conf.user.copilot.enabled end,
        config = function()
            require 'copilot_cmp'.setup()
            require("copilot").setup({
                suggestion = { enabled = true },
                panel = { enabled = true },
            })
        end
    },
    --- codeium
    { "Exafunction/codeium.vim" },
    {
        "jcdickinson/codeium.nvim",
        event = 'VeryLazy',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        cond = function() return conf.user.codeium.enabled end,
        config = function()
            vim.g.codeium_manual = true
            vim.g.codeium_disable_bindings = 1
            ---@diagnostic disable-next-line: different-requires
            require("codeium").setup({
                -- config_path = home .. "/.config/secrets/codeium_key.json"
            })
        end
    },

    -- Lazy
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup(
                {
                    api_key_cmd = "gpg --decrypt " .. home .. "/.config/secrets/open_ai_key.txt.gpg",
                    -- api_host_cmd = "echo -n 'api.openai.com'",
                    -- model = "code-davinci-edit-001", -- legacy
                    -- model = "gpt-4", $0.03 / 1K tokens
                    -- model = "gpt-3.5-turbo", $0.0015 / 1K tokens
                    -- model = "gpt-3.5-turbo-instruct",
                    openai_params = {
                        model = "gpt-3.5-turbo",
                        frequency_penalty = 0,
                        presence_penalty = 0,
                        max_tokens = 600,
                        temperature = 0,
                        top_p = 1,
                        n = 1,
                    },
                    openai_edit_params = {
                        model = "gpt-3.5-turbo-instruct",
                        max_tokens = 600,
                        temperature = 0.1,
                        top_p = 1,
                        n = 1,
                    },
                }
            )
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },

    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

    -- GX improvement
    {
        "chrishrb/gx.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufEnter" },
        config = function()
            require("gx").setup {
                open_browser_app = conf.so.is_mac and "open" or "xdg-open",
                handlers = {
                    plugin = true,       -- open plugin links in lua (e.g. packer, lazy, ..)
                    github = true,       -- open github issues
                    package_json = true, -- open dependencies from package.json
                },
                handler_options = {
                    search_engine = "google", -- you can select between google, bing and duckduckgo
                },
            }
        end,
    }
    ,
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        event = 'VeryLazy',
        config = function()
            require 'toggleterm'.setup {
                direction = 'float',
                close_on_exit = false,
                float_opts = {
                    border = 'curved',
                    winblend = 0,
                    highlights = {
                        border = 'Normal',
                        background = 'Normal'
                    }
                }
            }
        end
    },
    {
        'pwntester/octo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require "octo".setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup { scope = { highlight = highlight, enabled = false } }

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end
    },
    -- new surround plugin use (sa for add surround, sd for delete surround)
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function() require('mini.surround').setup() end
    },
    -- find replace in all files
    {
        'nvim-pack/nvim-spectre',
        config = function() require('spectre').setup() end,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({
                merge_keywords = true,
                pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
                keywords = {
                    BACKLOG = { color = '#7711FF' },
                    FIX = {
                        icon = " ", -- icon used for the sign, and in search results
                        color = "error", -- can be a hex color, or a named color (see below)
                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                        -- signs = false, -- configure signs for some keywords individually
                    },
                    TODO = { icon = " ", color = "info" },
                    ARRANGE = { icon = " ", color = "hint" },
                    ACT = { icon = "󰙨", color = "info" },
                    ASSERT = { icon = "", color = "success" },
                    HACK = { icon = " ", color = "warning" },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                },
                gui_style = {
                    -- fg = "NONE", -- The gui style to use for the fg highlight group.
                    bg = "NONE", -- The gui style to use for the bg highlight group.
                },
                highlight = {
                    keyword = "fg",
                },
                colors = {
                    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                    info = { "DiagnosticInfo", "#2563EB" },
                    hint = { "DiagnosticHint", "#10B981" },
                    default = { "Identifier", "#7C3AED" },
                    test = { "Identifier", "#FF00FF" },
                    success = { "MiniTestPass", "#69FF94" }
                },
                search = {
                    command = "rg",
                    args = {
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--no-ignore-vcs",
                    },

                }
            })
        end
    },
    {
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("coverage").setup() end
    },
    {
        "GiuseppeMP/blanket.nvim",
        lazy = false,
        -- config = function()
        --     require("blanket").setup({
        --         -- can use env variables and anything that could be interpreted by expand(), see :h expandcmd()
        --         -- OPTIONAL
        --         report_path = vim.fn.getcwd() .. "/target/site/jacoco/jacoco.xml",
        --         -- refresh gutter every time we enter java file
        --         -- defauls to empty - no autocmd is created
        --         filetypes = "java",
        --         -- for debugging purposes to see whether current file is present inside the report
        --         -- defaults to false
        --         silent = true,
        --         -- can set the signs as well
        --         signs = {
        --             priority = 10,
        --             incomplete_branch = "┃",
        --             uncovered = "┃",
        --             covered = "┃",
        --             sign_group = "Blanket",

        --             -- and the highlights for each sign!
        --             -- useful for themes where below highlights are similar
        --             incomplete_branch_color = "yellow",
        --             covered_color = "green",
        --             uncovered_color = "Error",
        --         },

        --     })
        -- end
    },
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    },
    {
        "folke/neodev.nvim",
        opts = {},
        config = function()
            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
        end
    },
    {
        "tiagovla/scope.nvim",
        config = function()
            require('scope').setup {}
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        event = 'VeryLazy',
        config = function()
            require('nvim-dap-virtual-text').setup {}
        end
    },
    {
        "SmiteshP/nvim-navic"
    },
    { "sotte/presenting.vim" },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        "m4xshen/autoclose.nvim",
        enabled = false,
        config = function()
            require("autoclose").setup({
                keys = {
                    ["("] = { escape = true, close = true, pair = "()" },
                    ["["] = { escape = true, close = true, pair = "[]" },
                    ["{"] = { escape = true, close = true, pair = "{}" },

                    [">"] = { escape = true, close = false, pair = "<>" },
                    [")"] = { escape = true, close = false, pair = "()" },
                    ["]"] = { escape = true, close = false, pair = "[]" },
                    ["}"] = { escape = true, close = false, pair = "{}" },

                    ['"'] = { escape = true, close = true, pair = '""' },
                    ["'"] = { escape = true, close = true, pair = "''" },
                    ["`"] = { escape = true, close = true, pair = "``" },
                },
                options = {
                    disabled_filetypes = { "text" },
                    disable_when_touch = false,
                    touch_regex = "[%w(%[{]",
                    pair_spaces = false,
                    auto_indent = true,
                    disable_command_mode = false,
                }
            })
        end
    },
    {
        "rest-nvim/rest.nvim",
        event = 'VeryLazy'
    },
    {
        'justinhj/battery.nvim',
        config = function()
            require 'battery'.setup {
                update_rate_seconds = 30,           -- Number of seconds between checking battery status
                show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
                show_plugged_icon = true,           -- If true show a cable icon alongside the battery icon when plugged in
                show_unplugged_icon = true,         -- When true show a diconnected cable icon when not plugged in
                show_percent = true,                -- Whether or not to show the percent charge remaining in digits
                vertical_icons = true,              -- When true icons are vertical, otherwise shows horizontal battery icon
                multiple_battery_selection = 1,
            }
        end
    },
    {
        'gbrlsnchs/telescope-lsp-handlers.nvim'
    },
    {
        'caenrique/swap-buffers.nvim',
        event = 'VeryLazy',
        config = function()
            require('swap-buffers').setup({
                ignore_filetypes = { 'NvimTree' }
            })
        end
    },
    {
        "simaxme/java.nvim",
        name = 'simaxmejava',
        config = function()
            require("java").setup {
                rename = {
                    enable = true,         -- enable the functionality for renaming java files
                    nvimtree = true,       -- enable nvimtree integration
                    write_and_close = true -- automatically write and close modified (previously unopened) files after refactoring a java file
                },
                snippets = {
                    enable = false -- enable the functionality for java snippets
                }
            }
        end
    },
    {
        "epwalsh/obsidian.nvim",
        tag = 'v2.5.3',
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },
    {
        "michaelb/sniprun",
        build = 'sh install.sh',
        config = function()
            ---@diagnostic disable-next-line: undefined-field
            require "sniprun".setup {
                display = {
                    "TempFloatingWindow", --# display results in a floating window
                },
                live_mode_toggle = 'enable',
                live_display = { "TerminalOk" },
                display_options = {
                    terminal_scrollback = vim.o.scrollback,
                    terminal_line_number = true,
                    terminal_signcolumn = true,
                    terminal_position = "vertical",
                    terminal_width = 45,
                    terminal_height = 20,
                    notification_timeout = 5
                },
            }
        end,
    },
    {
        "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
            "norg",
        },
        config = function()
            require("autolist").setup()

            vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
            vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
            -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
            vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
            vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
            vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
            vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
            -- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

            -- cycle list types with dot-repeat
            vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
            vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

            -- if you don't want dot-repeat
            -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
            -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

            -- functions to recalculate list on edit
            vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
            vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
            vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
            vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
        end,
    },
    -- restore session with <leader>sl
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() }
    },
    -- measure startup time
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
        opts = function()
            -- don't use animate when scrolling with the mouse
            local mouse_scrolled = false
            for _, scroll in ipairs({ "Up", "Down" }) do
                local key = "<ScrollWheel" .. scroll .. ">"
                vim.keymap.set({ "", "i" }, key, function()
                    mouse_scrolled = true
                    return key
                end, { expr = true })
            end

            local animate = require("mini.animate")
            return {
                resize = { enable = false },
                open = { enable = false },
                close = { enable = false },
                cursor = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
                },
                scroll = {
                    timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
                    subscroll = animate.gen_subscroll.equal({
                        predicate = function(total_scroll)
                            if mouse_scrolled then
                                mouse_scrolled = false
                                return false
                            end
                            return total_scroll > 1
                        end,
                    }),
                },
            }
        end,
    },
    {
        "mxsdev/nvim-dap-vscode-js",
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
    {
        'mrcjkb/rustaceanvim',
        tag = '3.15.0', -- Recommended
        -- ft = { 'rust' },
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
    -- Refactoring book by Martin Fowler -- disable due nvimtree width issue
    -- { 'ThePrimeagen/refactoring.nvim' },
    --
    --  [markdown markmap]
    --  https://github.com/Zeioth/markmap.nvim
    {
        "Zeioth/markmap.nvim",
        build = "yarn global add markmap-cli",
        cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
        opts = {
            html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
            hide_toolbar = false,              -- (default)
            grace_period = 3600000             -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
        },
        config = function(_, opts) require("markmap").setup(opts) end
    },
    -- Lua
    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }
}
return M.plugins
