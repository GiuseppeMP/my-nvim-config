---@diagnostic disable: missing-fields
local function config()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        return
    end

    configs.setup {
        autotag = {
            enable = true,
            filetypes = { "html", "xml" }
        },
        enable = true,
        context_commentstring = { enable = false },
        -- https://github.com/nvim-treesitter/nvim-treesitter-refactor#highlight-definitions
        refactor = {
            highlight_current_scope = { enable = false },
            highlight_definitions = {
                enable = true,
                -- Set to false if you have an `updatetime` of ~100.
                clear_on_cursor_move = false,
            },
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = "gR",
                },
            },
        },
        textobjects = {
            swap = {
                enable = true,
                swap_next = { ["<leader>xp"] = "@parameter.inner" },
                swap_previous = { ["<leader>xP"] = "@parameter.inner" }
            },
            lsp_interop = {
                enable = true,
                border = "rounded",
                peek_definition_code = {
                    ["gp"] = "@function.outer",
                    ["gP"] = "@class.outer"
                }
            },
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                    ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                    ["l="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
                    ["h="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },

                    ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
                    ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

                    ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
                    ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

                    ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                    ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

                    ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
                    ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

                    ["am"] = { query = "@function.outer", desc = "Select outer part of a method definition" },
                    ["im"] = { query = "@function.inner", desc = "Select inner part of a method definition" },

                    ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]f"] = { query = "@call.outer", desc = "Next function call start" },
                    ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
                    ["]c"] = { query = "@class.outer", desc = "Next class start" },
                    ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                    ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

                    -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                    -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                    ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                    ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                },
                goto_next_end = {
                    ["]F"] = { query = "@call.outer", desc = "Next function call end" },
                    ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
                    ["]C"] = { query = "@class.outer", desc = "Next class end" },
                    ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
                    ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
                },
                goto_previous_start = {
                    ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
                    ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
                    ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                    ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
                    ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
                },
                goto_previous_end = {
                    ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
                    ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
                    ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                    ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
                    ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
                }, }
        },
        ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false,     -- install languages synchronously (only applied to `ensure_installed`)
        auto_install = true,
        ignore_install = { "" },  -- List of parsers to ignore installing
        autopairs = { enable = true, },
        highlight = {
            enable = true,    -- false will disable the whole extension
            disable = { "" }, -- list of language that will be disabled
            use_languagetree = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            disable = { "yaml", "typescript", "javascript", "ts", "js" }
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        -- https://github.com/RRethy/nvim-treesitter-textsubjects
        textsubjects = {
            enable = true,
            prev_selection = ',', -- (Optional) keymap to select the previous selection
            keymaps = {
                ['.'] = 'textsubjects-smart',
                [';'] = 'textsubjects-container-outer',
                ['i;'] = 'textsubjects-container-inner',
            },
        },
    }


    local rainbow_delimiters = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
        strategy = {
            [''] = rainbow_delimiters.strategy['global'],
            vim = rainbow_delimiters.strategy['local'],
        },
        query = {
            [''] = 'rainbow-delimiters',
            lua = 'rainbow-blocks',
        },
        highlight = {
            'RainbowDelimiterRed',
            'RainbowDelimiterYellow',
            'RainbowDelimiterBlue',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterCyan',
        },
    }
end
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = config,
        event = 'VeryLazy'
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'RRethy/nvim-treesitter-textsubjects',         event = 'VeryLazy' },
    { 'nvim-treesitter/nvim-treesitter-refactor',    event = 'VeryLazy' },
    { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'VeryLazy' },
}
