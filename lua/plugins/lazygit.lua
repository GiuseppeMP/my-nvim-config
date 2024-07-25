vim.g.lazygit_floating_window_winblend = 0       -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 1 -- scaling factor for floating window
vim.g.lazygit_floating_window_use_plenary = 1    -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1              -- fallback to 0 if neovim-remote is not installed
vim.g.lazygit_use_custom_config_file_path = 0    -- config file path is evaluated if this value is 1

return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
}
