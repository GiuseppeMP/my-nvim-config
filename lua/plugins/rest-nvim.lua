return {
    {
        "rest-nvim/rest.nvim",
        event = 'VeryLazy',
        enabled = false,
        ft = "http",
        dependecies = { "luarocks.nvim" },
        config = function()
            require("rest-vim").setup()
        end,
    },
}
