-- Module that returns the list of the vim plugins that must be installed.
-- Modulo que retorna a lista de vim plugins que precisam ser instalados.
-- You can manage your plugins here, separated from plugin manager.

---equivalent of packer rtp='.'
---@param plugin any
local lazy_rtp = function(plugin)
    vim.opt.rtp:append(plugin.dir)
end

vim.g.smoothie_enabled = 1
vim.g.smoothie_speed_linear_factor = 70          -- default 60
vim.g.smoothie_speed_exponentiation_factor = 0.5 -- default 0.5
vim.g.smoothie_experimental_mappings = 1

local plugins = {

    -- Repeat plugins cmds using dot command
    -- Repetir os cmds dos plugins usando ponto
    { name = 'tpope/vim-repeat' },

    -- Fast add, remove, or change word surrounds (cs,ys,ds)[motion][char]
    -- Atalho para add, alterar ou remover caracteres em volta das palavras.
    { name = 'tpope/vim-surround' },

    -- Powerline fonts for VIM
    -- Fonts powerline para VIM
    { name = 'powerline/powerline-fonts' },

    -- Fast comments using gcc or v(selection) gcc
    -- Comentarios rapidos atraves de gcc ou v(selecao)gcc
    { name = "tpope/vim-commentary" },

    -- parser, formatter, better syntax highlight
    {
        name = 'nvim-treesitter/nvim-treesitter',
        packer = { run = ':TSUpdate' },
        lazy = { build = ':TSUpdate' }
    },

    -- text objects treesitter
    { name = 'nvim-treesitter/nvim-treesitter-textobjects' },

    -- text objects improved by subjects
    { name = 'RRethy/nvim-treesitter-textsubjects' },

    -- refactor module for tresitter
    { name = 'nvim-treesitter/nvim-treesitter-refactor' },

    -- comment string for multiple languages in the same buffer
    { name = 'JoosepAlviste/nvim-ts-context-commentstring' },

    -- better context, for long functions
    { name = 'romgrk/nvim-treesitter-context' },

    -- auto close and auto rename xml, htmls tags
    { name = 'windwp/nvim-ts-autotag' },

    -- Rainbow in Treesitter
    { name = 'HiPhish/nvim-ts-rainbow2' },

    -- close buffers without exit vim or messing layouts
    { name = 'moll/vim-bbye' },

    -- Plugin for buffers as tabs
    {
        name = 'akinsho/bufferline.nvim',
        spec = { tag = 'v3.5.0' }
    },
    { name = 'windwp/windline.nvim',         lazy = { config = function() require('user.plugins.configs.windline') end } },

    -- Plugins for VIM :colorscheme collections
    { name = 'rafi/awesome-vim-colorschemes' },
    { name = 'artanikin/vim-synthwave84' },
    { name = 'ryanoasis/vim-devicons' },
    { name = 'Mofiqul/dracula.nvim' },

    -- The awesome coconut oil rose-pine
    {
        name = 'rose-pine/neovim',
        lazy = { name = 'rose-pine-neovim' },
        packer = { as = 'rose-pine-neovim' },
    },

    -- Trigger a highlight in the appropriate direction when pressing these keys: f, F, t, T
    {
        name = 'unblevable/quick-scope',
        lazy = { lazy = false, init = function() vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' } end }
    },

    -- Git commands cli by :G (command)
    -- Interface git atraves de :G (comando)
    { name = 'tpope/vim-fugitive' },

    -- Fuzzy finder written in lua
    {
        name = 'nvim-telescope/telescope.nvim',
        spec = { tag = '0.1.1' }
    },

    -- Markdown Preview
    {
        name = 'iamcco/markdown-preview.nvim',
        packer = { run = 'cd app && yarn install', cmd = 'MarkdownPreview' },
        lazy = { build = 'cd app && yarn install', cmd = 'MarkdownPreview' }
    },

    -- Tagbar outline
    { name = 'preservim/tagbar' },

    -- Collection of plugins for tests, Debug and TDD
    { name = 'nvim-lua/plenary.nvim' },
    { name = 'vim-test/vim-test' },
    { name = 'nvim-neotest/neotest' },
    { name = 'nvim-neotest/neotest-vim-test' },
    { name = 'nvim-neotest/neotest-plenary' },
    -- vim tests
    { name = 'kana/vim-vspec' },
    -- fix cursor in tests/debug
    { name = 'antoinemadec/FixCursorHold.nvim' },
    -- go to test file (alernate)
    { name = 'tpope/vim-projectionist' },

    --Plug for mark files and terminals on the fly, to avoid repeat commands like
    --bnext, bprev, or fzf
    { name = 'ThePrimeagen/harpoon' },

    -- Refactoring book by Martin Fowler -- disable due nvimtree width issue
    -- { name = 'ThePrimeagen/refactoring.nvim' },

    -- Plug for smoothie ctrl-d and ctrl-up scrolling
    { name = 'psliwka/vim-smoothie' },

    -- Plug for float windows like fzf but for anything and vim-test
    -- Plugin para utilizar janelas flutuantes parecido com fzf, suportar vim-test
    { name = 'voldikss/vim-floaterm' },

    -- Plugin for snippets in different languages
    -- Plugin de snipptes (~)
    {
        name = 'honza/vim-snippets',
        packer = { rtp = '.' },
        lazy = {
            lazy = false,
            config = lazy_rtp
        }
    },

    -- Git buffersigns
    {
        name = 'lewis6991/gitsigns.nvim',
    },

    -- vim8, neovim async interface
    { name = 'skywind3000/asyncrun.vim' },

    -- vim8, neovim async interface
    { name = 'lewis6991/async.nvim' },

    -- tmux <-> neovim navigation using C-l,k,j,h
    { name = 'christoomey/vim-tmux-navigator' },

    -- Markdown preview
    { name = 'toppair/peek.nvim' },

    -- toggle C-a/x custom values
    { name = 'nat-418/boole.nvim' },

    -- Mason tools, LSPs, Debug Servers
    { name = 'williamboman/mason.nvim' },
    { name = 'williamboman/mason-lspconfig.nvim' },
    { name = 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    { name = 'neovim/nvim-lspconfig' },
    { name = 'mfussenegger/nvim-dap' },
    { name = 'mfussenegger/nvim-jdtls' },
    { name = 'jayp0521/mason-nvim-dap.nvim' },
    { name = 'rcarriga/nvim-dap-ui' },
    { name = 'jose-elias-alvarez/null-ls.nvim' },
    { name = 'mfussenegger/nvim-dap-python' },
    -- lsp kind icons
    { name = 'onsails/lspkind.nvim' },

    -- Debug adapter for tests python
    { name = 'nvim-neotest/neotest-python' },

    -- File explorer
    {
        name = 'nvim-tree/nvim-tree.lua',
        packer = { requires = { 'nvim-tree/nvim-web-devicons' }, tag = 'nightly' },
        lazy = { dependencies = { 'nvim-tree/nvim-web-devicons' }, tag = 'nightly' }
    },

    -- startup screen
    {
        name = 'goolord/alpha-nvim',
        lazy = {
            config = function()
                require("alpha").setup(require 'alpha.themes.startify'.config)
            end
        }
    },

    -- undo history tree
    { name = 'mbbill/undotree' },

    -- cmp for autocompletion
    { name = 'hrsh7th/cmp-nvim-lsp' }, -- lsp completions
    { name = 'hrsh7th/cmp-buffer' },   -- buffer completions
    { name = 'hrsh7th/cmp-path' },     -- path completions
    { name = 'hrsh7th/cmp-cmdline' },  -- cmdline completions
    { name = 'hrsh7th/nvim-cmp' },     -- completion plugin
    -- cmp vsnip users
    {
        name = 'hrsh7th/cmp-vsnip',
        packer = { rtp = '.' },
        lazy = {
            lazy = false,
            config = lazy_rtp
        }
    },
    {
        name = 'hrsh7th/vim-vsnip',
        packer = { rtp = '.' },
        lazy = {
            lazy = false,
            config = lazy_rtp
        }
    },
    -- cmp  luasnip users
    {
        name = 'L3MON4D3/LuaSnip',
        packer = { tag = 'v1.2.*', run = "make install_jsregexp" },
        lazy = { tag = 'v1.2.1', build = "make install_jsregexp" }
    },
    { name = 'saadparwaiz1/cmp_luasnip' },
    -- cmp ultisnips users
    { name = 'SirVer/ultisnips' },
    { name = 'quangnguyen30192/cmp-nvim-ultisnips' },
    -- cmp snippy users
    { name = 'dcampos/nvim-snippy' },
    { name = 'dcampos/cmp-snippy' },
    -- cmp snippet collections
    { name = "rafamadriz/friendly-snippets" },

    -- which key
    { name = "folke/which-key.nvim" },

    -- terminal plugin
    { name = 'NvChad/nvterm' },

    -- better lsp progress ui
    {
        name = 'j-hui/fidget.nvim'
    },

    -- better nvim ui
    { name = 'stevearc/dressing.nvim' },

    -- clipboard/yank manager
    {
        name = 'AckslD/nvim-neoclip.lua',
        lazy = {
            config = function() require 'neoclip'.setup {} end,
            dependencies = { 'nvim-telescope/telescope.nvim', 'ibhagwan/fzf-lua' }
        },
    },

    -- better ui for diagnostics
    {
        name = "folke/trouble.nvim",
        lazy = {
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
        }
    },

    -- better easymotion
    {
        name = "phaazon/hop.nvim",
        lazy = {
            config = function()
                -- using homerow hopping is much confortable and faster
                local querty_home_row = 'asdfghjkl;';
                -- local colemak_dh_home_row = 'arstgmneio';
                require 'hop'.setup({ keys = querty_home_row .. 'woei' })
            end,
            branch = "v2"
        }
    },

    -- easymotion by syntax hop+treesitter
    { name = 'mfussenegger/nvim-treehopper' },

    -- better folding (using treesitter, lsp, etc)
    {
        name = "kevinhwang91/nvim-ufo",
        lazy = {
            dependencies = { 'kevinhwang91/promise-async' },
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
    },

    -- zoxide (smart cd) integration
    {
        name = 'jvgrootveld/telescope-zoxide',
        lazy = { dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } }
    },

    -- markdown lint/sintax/hi
    {
        name = 'preservim/vim-markdown',
        lazy = { dependencies = { 'godlygeek/tabular' } }
    },
    {
        name = 'GiuseppeMP/overseer.nvim',
    },
    {
        name = "ellisonleao/carbon-now.nvim",
        lazy = {
            cmd = "CarbonNow",
            config = function()
                require('carbon-now').setup(
                    { open_cmd = conf.so.is_mac and "open" or "xdg-open" }
                )
            end
        }
    },

    -- AI supports
    ---  copilot + cmp
    {
        name = "zbirenbaum/copilot-cmp",
        lazy = {
            dependencies = "zbirenbaum/copilot.lua",
            cond = function() return conf.user.copilot.enabled end,
            config = function()
                require 'copilot_cmp'.setup()
                require("copilot").setup({
                    suggestion = { enabled = true },
                    panel = { enabled = true },
                })
            end
        }
    },

    --- codeium
    {
        name = "jcdickinson/codeium.nvim",
        lazy = {
            dependencies = {
                "nvim-lua/plenary.nvim",
                "hrsh7th/nvim-cmp"
            },
            cond = function() return conf.user.codeium.enabled end,
            config = function()
                require("codeium").setup({})
            end
        }
    },


    -- GX improvement
    {
        name = "chrishrb/gx.nvim",
        lazy = {
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
                }
            end,
        }
    }
    ,
    {
        name = 'akinsho/toggleterm.nvim',
        lazy = {
            version = "*",
            config = function()
                require 'toggleterm'.setup {
                    open_mapping = [[<M-f>]],
                    direction = 'float',
                    close_on_exit = false,
                    float_opts = {
                        border = 'curved',
                        winblend = 1,
                        highlights = {
                            border = 'Normal',
                            background = 'Normal'
                        }
                    }
                }
            end
        }
    },
}


return plugins
