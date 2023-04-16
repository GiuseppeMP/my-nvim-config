require("nvterm").setup({
    terminals = {
        type_opts = {
            float = {
                relative = 'editor',
                row = 0.1,
                col = 0.1,
                width = 0.8,
                height = 0.8,
                border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = .3, },
            vertical = { location = "rightbelow", split_ratio = .5 },
        },
    }
})
