return
{
    'AckslD/nvim-neoclip.lua',
    -- event = 'VeryLazy',
    -- enabled = false,
    config = function()
        require 'neoclip'.setup {
            default_register = '+',
            keys = {
                fzf = {
                    select = 'default',
                    paste = 'p',
                    paste_behind = 'P',
                    custom = {},
                },
            }
        }
    end,
    dependencies = { 'nvim-telescope/telescope.nvim', 'ibhagwan/fzf-lua', 'kkharji/sqlite.lua' }
}
