local config = function()
    require 'nvim-web-devicons'.setup {
        override_by_extension = {
            ['feature'] = {
                icon = " ",
                color = "#428850",
                cterm_color = "65",
                name = "cucumber"
            }
        },
    }
end

return {
    "nvim-web-devicons",
    config = config,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "echasnovski/mini.nvim",
    }
}
