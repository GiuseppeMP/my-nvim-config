require("telescope").load_extension('harpoon')

require("telescope").setup {
    pickers = {
        buffers = {
            theme = "dropdown",
        },
        git_branches = {
            theme = "dropdown",
        },
        diagnostics = {
            theme = "ivy",
        },
        git_commits = {
            theme = "ivy",
        },
        quickfix = {
            theme = "ivy",
        },
    },
}
