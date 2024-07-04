return {
    {
        'dgagn/diagflow.nvim',
        enabled = false,
        -- event   = 'LspAttach',
        config  = function()
            require('diagflow').setup({
                padding_top = 1,
                padding_right = 0,
                -- show_sign = true,
                show_borders = true
            })
        end
    }
}
