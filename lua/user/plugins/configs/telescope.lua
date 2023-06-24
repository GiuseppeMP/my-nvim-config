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

-- fix issue https://github.com/nvim-telescope/telescope.nvim/issues/2027 introduced by neovim >= 0.9.0
vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
        end
    end,
})
