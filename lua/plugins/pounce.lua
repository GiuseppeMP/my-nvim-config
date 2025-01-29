return
{
    'rlane/pounce.nvim',
    config = function()
        require 'pounce'.setup {
            accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
            accept_best_key = "<enter>",
            multi_window = true,
            debug = false,
        }
        local map = vim.keymap.set
        map("n", "gs", function() require 'pounce'.pounce {} end)
        -- map("n", "S", function() require 'pounce'.pounce { do_repeat = true } end)
        -- map("x", "s", function() require 'pounce'.pounce {} end)
        -- map("o", "gs", function() require 'pounce'.pounce {} end)
        -- map("n", "S", function() require 'pounce'.pounce { input = { reg = "/" } } end)
    end

}
