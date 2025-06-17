return {
    {
        "folke/tokyonight.nvim",
        enabled = true,
        config = function()
            require('tokyonight').setup({
                style = 'moon',
                transparent = true,
                transparent_sidebar = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "transparent", -- style for sidebars, see below
                    floats = "transparent",   -- style for floating windows
                },
            })
        end
    },
}
