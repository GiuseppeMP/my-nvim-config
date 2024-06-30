return {
    'folke/flash.nvim',
    event = "VeryLazy",
    opts = {},
    enabled = false,
    config = function()
        require('flash').setup()
    end,
}
