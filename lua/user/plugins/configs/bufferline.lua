vim.opt.termguicolors = true

local tokyo_colors = require("tokyonight.colors").setup()

local tokyo = { fg = tokyo_colors.fg, bg = 'none', sp = tokyo_colors.sp }

require 'bufferline'.setup({
    highlights = {
        fill = tokyo,
        background = tokyo,
        tab = { fg = tokyo_colors.magenta, bg = tokyo.bg },
        tab_selected = { fg = tokyo_colors.blue, bg = tokyo.bg },
        tab_close = tokyo,
        close_button = tokyo,
        close_button_visible = tokyo,
        close_button_selected = tokyo,
        buffer_visible = tokyo,
        buffer_selected = {
            fg = '#69ff94',
            bg = tokyo.bg
        },
        numbers = tokyo,
        numbers_visible = tokyo,
        numbers_selected = {
            fg = '#69ff94',
            bg = tokyo.bg,
            bold = true,
            italic = true,
        },
        diagnostic = tokyo,
        diagnostic_visible = tokyo,
        diagnostic_selected = tokyo,
        hint = tokyo,
        hint_visible = tokyo,
        hint_selected = tokyo,
        info = tokyo,
        info_visible = tokyo,
        info_selected = tokyo,
        separator_visible = tokyo,
    },
    options = {
        themable = true,
        mode = 'buffers',
        numbers = "ordinal",
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        -- indicator = { style = "icon", icon = " │ " },
        buffer_close_icon = '',
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 35,
        max_prefix_length = 35, -- prefix used when a buffer is de-duplicated
        tab_size = 20,
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = {},
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        color_icons = true
    },
})
