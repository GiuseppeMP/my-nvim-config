local tokyo_colors = require("tokyonight.colors").setup()
local notify = require("notify")

-- notify.setup({
--     level = "WARN",
--     stages = "fade",
--     timeout = 300,
--     max_width = 100,
-- })

vim.cmd('highlight NormalFloat  guibg=' .. tokyo_colors.bg)
-- vim.cmd('highlight NoiceCmdlinePrompt guibg=' .. tokyo_colors.bg )
-- vim.cmd('highlight Title guibg=' .. tokyo_colors.bg )
-- vim.cmd('highlight NoicePrompt guibg=' .. tokyo_colors.bg )
-- vim.cmd('highlight NoiceFormatTitle guibg=' .. tokyo_colors.bg )

vim.diagnostic.config({
    update_in_insert = false
})

require("noice").setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
        progress = {
            enabled = true,
            throttle = 1000 / 10, -- frequency to update lsp progress message
            view = "mini",
        }
    },
    views = {

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
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
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
                winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
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
        },
        {
            filter = {
                event = "notify",
                min_height = 15
            },
            view = 'split'
        },
        {
            filter = {
                event = "msg_show",
                kind = "echo",
                -- cond = function(message)
                --     print(vim.inspect(message))
                --     return true
                -- end,
            },
            opts = { skip = true },
        },
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
        lsp_doc_border = false,
    },

})
