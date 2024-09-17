return
{
    'AckslD/nvim-neoclip.lua',
    event = 'VeryLazy',
    config = function()
        require 'neoclip'.setup {
            keys = {
                telescope = {
                    i = {
                        paste = { '<c-j>', '<cr>' },
                        paste_behind = { '<c-k>' },
                        replay = '<c-q>',
                        delete = '<c-d>',
                        edit = '<c-e>',
                        custom = {},
                    },
                    n = {
                        paste = { '<c-j>', '<cr>' },
                        paste_behind = '<c-k>',
                        replay = 'q',
                        delete = 'd',
                        edit = { '<c-e>', 'e' },
                        custom = {},
                    },
                },
            }
        }
    end,
    dependencies = {
        'nvim-telescope/telescope.nvim',
        { 'kkharji/sqlite.lua', module = 'sqlite' },
    }
}
