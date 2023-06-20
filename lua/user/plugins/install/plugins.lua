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
        lazy = { build = ':TSUpdate', event = 'VeryLazy' }
    },

    -- text objects treesitter
    { name = 'nvim-treesitter/nvim-treesitter-textobjects', lazy = { event = 'VeryLazy' } },

    -- text objects improved by subjects
    { name = 'RRethy/nvim-treesitter-textsubjects', lazy = { event = 'VeryLazy' } },

    -- refactor module for tresitter
    { name = 'nvim-treesitter/nvim-treesitter-refactor', lazy = { event = 'VeryLazy' } },

    -- comment string for multiple languages in the same buffer
    { name = 'JoosepAlviste/nvim-ts-context-commentstring', lazy = { event = 'VeryLazy' } },

    -- better context, for long functions
    { name = 'romgrk/nvim-treesitter-context', lazy = { event = 'VeryLazy' } },

    -- auto close and auto rename xml, htmls tags
    { name = 'windwp/nvim-ts-autotag', lazy = { event = 'VeryLazy' } },

    -- Rainbow in Treesitter
    { name = 'HiPhish/nvim-ts-rainbow2', lazy = { event = 'VeryLazy' }},

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
    { name = "folke/tokyonight.nvim" },
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

    -- Tagbar outline
    { name = 'preservim/tagbar' },

    -- Collection of plugins for tests, Debug and TDD
    { name = 'nvim-lua/plenary.nvim',           lazy = { event = 'VeryLazy' } },
    { name = 'vim-test/vim-test',               lazy = { event = 'VeryLazy' } },
    { name = 'nvim-neotest/neotest',            lazy = { event = 'VeryLazy' } },
    { name = 'nvim-neotest/neotest-vim-test',   lazy = { event = 'VeryLazy' } },
    { name = 'nvim-neotest/neotest-plenary',    lazy = { event = 'VeryLazy' } },
    -- vim tests
    { name = 'kana/vim-vspec',                  lazy = { event = 'VeryLazy' } },
    -- fix cursor in tests/debug
    { name = 'antoinemadec/FixCursorHold.nvim', lazy = { event = 'VeryLazy' } },
    -- go to test file (alernate)
    { name = 'tpope/vim-projectionist',         lazy = { event = 'VeryLazy' } },

    --Plug for mark files and terminals on the fly, to avoid repeat commands like
    --bnext, bprev, or fzf
    { name = 'ThePrimeagen/harpoon' },

    -- Refactoring book by Martin Fowler -- disable due nvimtree width issue
    -- { name = 'ThePrimeagen/refactoring.nvim' },

    -- Plug for smoothie ctrl-d and ctrl-up scrolling
    { name = 'psliwka/vim-smoothie',            lazy = { event = 'VeryLazy' } },

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
            event = 'VeryLazy',
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
    { name = 'williamboman/mason-lspconfig.nvim', lazy = { event = 'VeryLazy' } },
    { name = 'WhoIsSethDaniel/mason-tool-installer.nvim', lazy = { event = 'VeryLazy' } },
    { name = 'neovim/nvim-lspconfig', lazy = { event = 'VeryLazy' } },
    { name = 'mfussenegger/nvim-jdtls' },
    { name = 'jose-elias-alvarez/null-ls.nvim' },
    { name = 'mfussenegger/nvim-dap-python' },

    -- dap configs
    { name = 'rcarriga/nvim-dap-ui' },
    { name = 'mfussenegger/nvim-dap' },
    {
        name = 'Weissle/persistent-breakpoints.nvim',
        lazy = {
            enabled = false, --wip
            config = function()
                require('persistent-breakpoints').setup({
                    save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
                    load_breakpoint_event = { "BufReadPost" }
                })
            end
        }
    },
    { name = 'jayp0521/mason-nvim-dap.nvim' },

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
            event = 'VeryLazy',
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
    -- { name = 'SirVer/ultisnips' },
    -- { name = 'quangnguyen30192/cmp-nvim-ultisnips' },
    -- cmp snippy users
    { name = 'dcampos/nvim-snippy' },
    { name = 'dcampos/cmp-snippy' },
    -- cmp snippet collections
    { name = "rafamadriz/friendly-snippets" },

    -- which key
    { name = "folke/which-key.nvim" },

    -- better lsp progress ui
    {
        name = 'j-hui/fidget.nvim', lazy = { tag = 'legacy' }
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
        name = 'stevearc/overseer.nvim',
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
    { name = "Exafunction/codeium.vim" },

    --- codeium
    {
        name = "jcdickinson/codeium.nvim",
        lazy = {
            event = 'VeryLazy',
            dependencies = {
                "nvim-lua/plenary.nvim",
                "hrsh7th/nvim-cmp",
            },
            cond = function() return conf.user.codeium.enabled end,
            config = function()
                vim.g.codeium_manual = true
                require("codeium").setup({})
            end
        }
    },

    -- Lazy
    {
        name = "jackMort/ChatGPT.nvim",
        lazy = {
            event = "VeryLazy",
            config = function()
                require("chatgpt").setup(
                    {
                        -- change for your config
                        api_key_cmd = "op read op://private/open_ai/api_key --no-newline",
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
        }
    },

    -- lazy.nvim
    {
        name = "folke/noice.nvim",
        lazy = {
            event = "VeryLazy",
            opts = {
                -- add any options here
            },
            config = function()
                require("noice").setup({
                    lsp = {
                        override = {
                            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                            ["vim.lsp.util.stylize_markdown"] = true,
                            ["cmp.entry.get_documentation"] = true,
                        },
                        progress = {
                            enabled = false
                        }
                    },
                    views = {
                        cmdline_popup = {
                            position = {
                                row = 24,
                                col = "50%",
                            },
                            size = {
                                width = 60,
                                height = "auto",
                            },
                            border = {
                                style = "rounded",
                                padding = { 0, 1 },
                            },
                            filter_options = {},
                            win_options = {
                                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                            },
                        },
                        popupmenu = {
                            relative = "editor",
                            position = {
                                row = 27,
                                col = "50%",
                            },
                            size = {
                                width = 60,
                                height = 10,
                            },
                            border = {
                                style = "rounded",
                                padding = { 0, 1 },
                            },
                            win_options = {
                                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                                -- winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                            },
                        },
                    },
                    routes = {
                        {
                            filter = {
                                event = "msg_show",
                                kind = "",
                                find = "written",
                            },
                            opts = { skip = true }
                        }
                    },
                    cmdline = {
                        enabled = true,         -- enables the Noice cmdline UI
                        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
                        opts = {},              -- global options for the cmdline. See section on views
                        format = {
                            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                            -- view: (default is cmdline view)
                            -- opts: any options passed to the view
                            -- icon_hl_group: optional hl_group for the icon
                            -- title: set to anything or empty string to hide
                            cmdline = { pattern = "^:", icon = "_", lang = "vim" },
                            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                            lua = {
                                pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
                                icon = "",
                                lang = "lua"
                            },
                            help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                            input = {}, -- Used by input()
                            -- lua = false, -- to disable a format, set to `false`
                        },
                    },
                    presets = {
                        bottom_search = true,
                        -- command_palette = true,
                        long_message_to_split = true,
                        inc_rename = false,
                        lsp_doc_border = false,
                    },

                })
            end,
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
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
            event = 'VeryLazy',
            config = function()
                require 'toggleterm'.setup {
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
