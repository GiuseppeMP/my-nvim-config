return {
    {
        "ellisonleao/carbon-now.nvim",
        cmd = "CarbonNow",
        config = function()
            require('carbon-now').setup(
                { open_cmd = conf.so.is_mac and "open" or "xdg-open" }
            )
        end
    },
}
