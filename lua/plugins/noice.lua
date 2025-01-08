local function config()
    vim.diagnostic.config({
        update_in_insert = false,
        underline = true,
        signs = true,
        virtual_text = false,
        float = {
            show_header = true,
            source = 'always',
            border = 'rounded',
            focusable = true,
        },
    })

    require("noice").setup({
        messages = {
            enabled = true
        },
        lsp = {
            signature = {
                enabled = true,
                auto_open = {
                    enabled = false,
                    trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                    luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                    throttle = 50,  -- Debounce lsp signature help request by 50ms
                },
                view = nil,         -- when nil, use defaults from documentation
                opts = {},          -- merged with defaults from documentation
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            progress = {
                enabled = true,
                throttle = 250,
                view = "mini",
            }
        },
        views = {
            hover = {
                border = { style = "rounded" },
                size = { max_width = 80 },
                -- relative = "editor",
            },
            mini = {
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "FloatBorder" },
                    winblend = 0
                }
            },
            cmdline_popup = {
                position = {
                    row = 5,
                    col = "50%",
                },
                size = {
                    width = "auto",
                    height = "auto",
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                filter_options = {},
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "FloatBorder" },
                    winblend = 0
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 8,
                    col = "50%",
                },
                size = {
                    width = "auto",
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "FloatBorder" },
                    winblend = 0
                },
            },
        },
        notify = {
            enabled = true
        },
        routes = {
            -- show @recording msg
            {
                view = "notify",
                filter = {
                    event = "msg_showmode",
                    find = "recording"
                }
            },
            -- hide writen message
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "written",
                },
                opts = { skip = true },
            },
            -- hide search not found hit BOTTOM|TOP
            {
                filter = {
                    event = "msg_show",
                    kind = "wmsg",
                    find = "search hit",
                },
                opts = { skip = true },
            },
            -- hide pattern not found error
            {
                filter = {
                    event = "msg_show",
                    kind = "emsg",
                    find = "Pattern not found:",
                },
                opts = { skip = true },
            },
            -- hide JDTLS echo ServiceReady
            {
                filter = {
                    event = "msg_show",
                    find = "ServiceReady",
                },
                opts = { skip = true },
            },
            -- hide JDTLS echo Starting java...
            {
                filter = {
                    event = "msg_show",
                    find = "Starting Java",
                },
                opts = { skip = true },
            },
            -- hide LSP spam of Validate Documents
            {
                filter = {
                    event = "lsp",
                    kind = "progress",
                    find = "Validate"
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = "lsp",
                    kind = "progress",
                    find = "Checking"
                },
                opts = { skip = true },
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
                search_down = { kind = "search", pattern = "^/", icon = "   ", lang = "regex" },
                search_up = { kind = "search", pattern = "^%?", icon = "   ", lang = "regex" },
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
            bottom_search = false,
            command_palette = false,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = true,
        },

    })
end
return
{
    "folke/noice.nvim",
    event = "VeryLazy",
    config = config,
    dependencies = {
        "MunifTanjim/nui.nvim",
        -- "rcarriga/nvim-notify",
    }
}
