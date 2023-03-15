require("telescope").load_extension('harpoon')

require("telescope").load_extension('zoxide')

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
        lsp_references = {
            theme = "ivy",
        },
        lsp_implementations = {
            theme = "ivy",
        },
        lsp_definitions = {
            theme = "ivy",
        },
        lsp_incoming_calls = {
            theme = "ivy",
        },
        lsp_outgoing_calls = {
            theme = "ivy",
        },
        lsp_type_definitions = {
            theme = "ivy",
        },
    }
}
