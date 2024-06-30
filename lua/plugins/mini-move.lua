return { {
    'echasnovski/mini.move',
    version = '*',
    config = function()
        require('mini.move').setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = nil,
                right = nil,
                down = '<S-Down>',
                up = '<S-Up>',

                -- Move current line in Normal mode
                line_left = nil,
                line_right = nil,
                line_down = '<S-Down>',
                line_up = '<S-Up>',
            },

            -- Options which control moving behavior
            options = {
                -- Automatically reindent selection during linewise vertical move
                reindent_linewise = true,
            },
        })
    end
} }
