return {
    {
        'caenrique/swap-buffers.nvim',
        event = 'VeryLazy',
        config = function()
            require('swap-buffers').setup({
                ignore_filetypes = { 'NvimTree' }
            })
        end
    },
}
