return {
    {
        'echasnovski/mini.align',
        version = '*',
        ft = { 'markdown', 'text', 'tex', 'plaintex', 'norg' },
        config = function()
            require('mini.align').setup({
                mappings = {
                    start = 'ga',
                    start_with_preview = 'gA',
                },
            })
        end
    },
}
