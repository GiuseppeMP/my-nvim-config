return {
    {
        'echasnovski/mini.align',
        version = '*',
        ft = { 'markdown', 'text', 'tex', 'plaintex', 'norg' },
        config = function()
            require('mini.align').setup({
                mappings = {
                    start = '<leader>ua',
                    start_with_preview = '<leader>uA',
                },
            })
        end
    },
}
