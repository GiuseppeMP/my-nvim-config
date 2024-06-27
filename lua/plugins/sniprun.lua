return {
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
}
