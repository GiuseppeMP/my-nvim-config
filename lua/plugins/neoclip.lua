return
{
    'AckslD/nvim-neoclip.lua',
    -- event = 'VeryLazy',
    -- enabled = false,
    config = function()
        require 'neoclip'.setup {
            keys = {
                telescope = {
                    i = {
                        -- select = '<cr>',
                        paste = '<cr>',
                        paste_behind = '<c-k>',
                        replay = '<c-q>', -- replay a macro
                        delete = '<c-d>', -- delete an entry
                        edit = '<c-e>',   -- edit an entry
                        custom = {},
                    },
                    n = {
                        -- select = '<cr>',
                        paste = '<cr>',
                        --- It is possible to map to more than one key.
                        -- paste = { 'p', '<c-p>' },
                        paste_behind = '<c-k>',
                        replay = 'q',
                        delete = 'd',
                        edit = 'e',
                        custom = {},
                    },
                },
                -- fzf = {
                --     select = 'default',
                --     paste = 'p',
                --     paste_behind = 'P',
                --     custom = {},
                -- },
            }
        }
    end,
    dependencies = { 'nvim-telescope/telescope.nvim', { 'kkharji/sqlite.lua', module = 'sqlite' }, }
}
