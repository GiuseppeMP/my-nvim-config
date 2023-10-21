-- Module that returns the list of the vim plugins that must be installed.
-- Modulo que retorna a lista de vim plugins que precisam ser instalados.
-- You can manage your plugins here, separated from plugin manager.

---equivalent of packer rtp='.'
-----@param plugin any
local lazy_rtp = function(plugin)
    ---@diagnostic disable-next-line: undefined-field
    vim.opt.rtp:append(plugin.dir)
end

vim.g.smoothie_enabled = 0
vim.g.smoothie_speed_linear_factor = 70          -- default 60
vim.g.smoothie_speed_exponentiation_factor = 0.5 -- default 0.5
vim.g.smoothie_experimental_mappings = 1

local M = {}

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
    { 'nvim-treesitter/nvim-treesitter-textobjects',        event = 'VeryLazy' },

    -- text objects improved by subjects
    { 'RRethy/nvim-treesitter-textsubjects',                event = 'VeryLazy' },

    -- refactor module for tresitter
    { 'nvim-treesitter/nvim-treesitter-refactor',           event = 'VeryLazy' },

    -- comment string for multiple languages in the same buffer
    { 'JoosepAlviste/nvim-ts-context-commentstring',        event = 'VeryLazy' },

    -- better context, for long functions
    { 'romgrk/nvim-treesitter-context',                     event = 'VeryLazy' },

    -- auto close and auto rename xml, htmls tags
    { 'windwp/nvim-ts-autotag',                             event = 'VeryLazy' },

    -- Rainbow in Treesitter
    -- { 'HiPhish/nvim-ts-rainbow2',                    event = 'VeryLazy' },
    { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim', event = 'VeryLazy' },

    -- close buffers without exit vim or messing layouts
    { 'moll/vim-bbye' },

    -- Plugin for buffers as tabs
    {
        'akinsho/bufferline.nvim',
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
        'preservim/tagbar',
    },

    -- Collection of plugins for tests, Debug and TDD
    { 'nvim-lua/plenary.nvim', },
    { 'GiuseppeMP/vim-test',   branch = 'master' },
    {
        'nvim-neotest/neotest',
        dependencies = {
            'haydenmeade/neotest-jest',
            'andy-bell101/neotest-java'
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

    -- Refactoring book by Martin Fowler -- disable due nvimtree width issue
    -- { 'ThePrimeagen/refactoring.nvim' },

    -- Plug for smoothie ctrl-d and ctrl-up scrolling
    { 'psliwka/vim-smoothie',           event = 'VeryLazy' },

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
        config = function()
            require("alpha").setup(require 'alpha.themes.startify'.config)
        end
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
    { 'stevearc/dressing.nvim',      enabled = false, lazy = false, },

    -- clipboard/yank manager
    {
        'AckslD/nvim-neoclip.lua',
        event = 'VeryLazy',
        config = function() require 'neoclip'.setup {} end,
        dependencies = { 'nvim-telescope/telescope.nvim', 'ibhagwan/fzf-lua' }
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
        dependencies = { 'godlygeek/tabular' }
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
    { "Exafunction/codeium.vim" },

    --- codeium
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
            require("codeium").setup({})
        end
    },

    -- Lazy
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        commit = "24bcca7",
        config = function()
            local home = os.getenv "HOME"
            require("chatgpt").setup(
                {
                    api_key_cmd = "gpg --decrypt " .. home .. "/.config/secrets/open_ai_key.txt.gpg",
                    api_host_cmd = "echo -n 'api.openai.com'",
                    openai_edit_params = {
                        model = "code-davinci-edit-001", -- code model
                        temperature = 0,
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
                opts = {
                    merge_keywords = true,
                    keywords = {
                        BACKLOG = { color = '#7711FF' }
                    }
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
        config = function()
            require('nvim-dap-virtual-text').setup {}
        end
    },
    {
        "SmiteshP/nvim-navic"
    }
}
return M.plugins
