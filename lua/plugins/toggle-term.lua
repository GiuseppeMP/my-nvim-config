return
{
    'akinsho/toggleterm.nvim',
    version = "*",
    event = 'VeryLazy',
    config = function()
        require 'toggleterm'.setup {
            direction = 'float',
            close_on_exit = false,
            float_opts = {
                border = 'curved',
                winblend = 0,
                highlights = {
                    border = 'Normal',
                    background = 'Normal'
                }
            }
        }
    end
}
