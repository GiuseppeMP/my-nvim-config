return {
    {
        "smoka7/hop.nvim",
        config = function()
            local hop = require('hop')
            local querty_home_row = 'asdfghjkl;';
            -- local colemak_dh_home_row = 'arstgmneio';
            local directions = require('hop.hint').HintDirection
            vim.keymap.set('n', 'f', function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end, { remap = true })
            vim.keymap.set('n', 'F', function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end, { remap = true })
            vim.keymap.set('n', 't', function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end, { remap = true })
            vim.keymap.set('n', 'T', function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
            end, { remap = true })
            hop.setup({ keys = querty_home_row .. 'woei' })
        end,
        version = "*"
    }
}
