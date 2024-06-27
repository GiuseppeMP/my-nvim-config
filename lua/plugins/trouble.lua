return {
    {
        "folke/trouble.nvim",
        event = 'VeryLazy',
        config = function()
            require 'trouble'.setup { signs = {
                error = conf.signs.error,
                warning = conf.signs.warn,
                hint = conf.signs.hint,
                information = conf.signs.info,
                other = conf.signs.other
            }, }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
}
