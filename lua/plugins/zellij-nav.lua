-- tmux <-> neovim navigation using C-l,k,j,h
-- { 'christoomey/vim-tmux-navigator' },
return
{
    "https://git.sr.ht/~swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    enable = true,
    keys = {
        { "<m-h>", "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left" } },
        { "<m-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down" } },
        { "<m-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up" } },
        { "<m-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
    },
    opts = {},
}
