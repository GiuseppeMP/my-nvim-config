return {
    'folke/flash.nvim',
    event = "VeryLazy",
    opts = {},
    config = function()
        require('flash').setup()
    end,
}
