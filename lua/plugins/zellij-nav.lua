-- tmux <-> neovim navigation using C-l,k,j,h
-- { 'christoomey/vim-tmux-navigator' },
return
{
    -- "swaits/zellij-nav.nvim",
    "GiuseppeMP/zellij-nav.nvim",
    enabled = function()
        return vim.fn.executable("zellij") == 1
    end,
    keys = {
        { "<m-h>", "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left" } },
        { "<m-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down" } },
        { "<m-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up" } },
        { "<m-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
    },
    opts = {},
}
