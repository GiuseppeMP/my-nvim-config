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

    -- Plugin for buffers as tabs
    {
        'akinsho/bufferline.nvim',
        -- enabled = false,
        version = '*'
    },
    { 'windwp/windline.nvim', config = function() require('user.plugins.configs.windline') end },


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

    -- Tagbar outline
    {
        'preservim/tagbar'
    },

    -- Collection of plugins for tests, Debug and TDD
    { 'nvim-lua/plenary.nvim', },
    { 'vim-test/vim-test' },
    {
        'nvim-neotest/neotest',
        dependencies = { 'andy-bell101/neotest-java' },
    },
    {
        'nvim-neotest/neotest-jest',
        dependencies = { "nvim-treesitter/nvim-treesitter" },
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
        config = lazy_rtp
    },
    {
        'stevearc/vim-vscode-snippets'
    },
    -- Git buffersigns
    -- vim8, neovim async interface
    { 'skywind3000/asyncrun.vim' },

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
        event = 'VeryLazy',
        enabled = false
    },
    {
        "nvim-neotest/nvim-nio"
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
        'dhruvasagar/vim-table-mode',
        ft = { 'markdown', 'text', 'tex', 'plaintex', 'norg' },
        config = function()
            -- require('tablemode').setup()
        end
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
        enabled = false,
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
                    timing = animate.gen_timing.linear({ duration = 200, unit = "total" }),
                },
                scroll = {
                    enable = false,
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
    },
    {
        'chentoast/marks.nvim',
        config = function()
            require 'marks'.setup {
                -- whether to map keybinds or not. default true
                default_mappings = true,
                -- which builtin marks to show. default {}
                builtin_marks = { ".", "<", ">", "^" },
                -- whether movements cycle back to the beginning/end of buffer. default true
                cyclic = true,
                -- whether the shada file is updated after modifying uppercase marks. default false
                force_write_shada = false,
                -- how often (in ms) to redraw signs/recompute mark positions.
                -- higher values will have better performance but may cause visual lag,
                -- while lower values may cause performance penalties. default 150.
                refresh_interval = 250,
                -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
                -- marks, and bookmarks.
                -- can be either a table with all/none of the keys, or a single number, in which case
                -- the priority applies to all marks.
                -- default 10.
                sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
                -- disables mark tracking for specific filetypes. default {}
                excluded_filetypes = {},
                -- disables mark tracking for specific buftypes. default {}
                excluded_buftypes = {},
                -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
                -- sign/virttext. Bookmarks can be used to group together positions and quickly move
                -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
                -- default virt_text is "".
                bookmark_0 = {
                    sign = "⚑",
                    virt_text = "hello world",
                    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
                    -- defaults to false.
                    annotate = false,
                },
                mappings = {}
            }
        end
    },
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    },
    {
        "kiyoon/jupynium.nvim",
        build = "pip3 install --user .",
        config = function() require("jupynium").setup {} end,
        -- build = "conda run --no-capture-output -n jupynium pip install .",
        -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),

    },
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require "colorizer".setup(

                {
                    filetypes = { "*" },
                    user_default_options = {
                        RGB = true,           -- #RGB hex codes
                        RRGGBB = true,        -- #RRGGBB hex codes
                        names = true,         -- "Name" codes like Blue or blue
                        RRGGBBAA = true,      -- #RRGGBBAA hex codes
                        AARRGGBB = false,     -- 0xAARRGGBB hex codes
                        rgb_fn = false,       -- CSS rgb() and rgba() functions
                        hsl_fn = false,       -- CSS hsl() and hsla() functions
                        css = false,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                        css_fn = false,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
                        -- Available modes for `mode`: foreground, background,  virtualtext
                        mode = "virtualtext", -- Set the display mode.
                        -- Available methods are false / true / "normal" / "lsp" / "both"
                        -- True is same as normal
                        tailwind = false,                                -- Enable tailwind colors
                        -- parsers can contain values used in |user_default_options|
                        sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
                        virtualtext = "■",
                        -- update color values even if buffer is not focused
                        -- example use: cmp_menu, cmp_docs
                        always_update = false
                    },
                    -- all the sub-options of filetypes apply to buftypes
                    buftypes = {},
                }

            )
        end
    },
    {
        'b0o/incline.nvim',
        config = function()
            local helpers = require 'incline.helpers'
            local navic = require 'nvim-navic'
            local devicons = require 'nvim-web-devicons'
            require('incline').setup {
                window = {
                    padding = 0,
                    margin = { horizontal = 0, vertical = 0 },
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                    if filename == '' then
                        filename = '[No Name]'
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    local res = {
                        ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or
                        '',
                        ' ',
                        { filename, gui = modified and 'bold,italic' or 'bold' },
                        -- guibg = '#44406e',
                        guibg = '#1a1b26',
                    }
                    if props.focused then
                        for _, item in ipairs(navic.get_data(props.buf) or {}) do
                            table.insert(res, {
                                { ' > ',     group = 'NavicSeparator' },
                                { item.icon, group = 'NavicIcons' .. item.type },
                                { item.name, group = 'NavicText' },
                            })
                        end
                    end
                    table.insert(res, ' ')
                    return res
                end,
            }
        end,
        -- Optional: Lazy load Incline
        event = 'VeryLazy',
    },
    {
        "SmiteshP/nvim-navic"
    },
    {
        'kmonad/kmonad-vim'
    },
    {
        'TobinPalmer/pastify.nvim',
        cmd = { 'Pastify' },
        config = function()
            require('pastify').setup {
                opts = {
                    absolute_path = false,        -- use absolute or relative path to the working directory
                    apikey = '',                  -- Api key, required for online saving
                    local_path = '/assets/imgs/', -- The path to put local files in, ex ~/Projects/<name>/assets/images/<imgname>.png
                    save = 'local',               -- Either 'local' or 'online'
                },
                ft = {                            -- Custom snippets for different filetypes, will replace $IMG$ with the image url
                    html = '<img src="$IMG$" alt="">',
                    markdown = '![]($IMG$)',
                    tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
                }, }
        end
    },
    {
        'echasnovski/mini.align',
        version = '*',
        ft = { 'markdown', 'text', 'tex', 'plaintex', 'norg' },
        config = function()
            require('mini.align').setup({
                mappings = {
                    start = 'ga',
                    start_with_preview = 'gA',
                },
            })
        end
    },
    {
        'Eandrju/cellular-automaton.nvim'
    },
    {
        'sindrets/diffview.nvim'
    },
    {
        'marilari88/neotest-vitest'
    },
    {
        import = "plugins"
    }
}
return M.plugins
