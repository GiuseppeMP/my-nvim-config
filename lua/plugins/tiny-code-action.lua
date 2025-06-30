return {
    {
        "rachartier/tiny-code-action.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },

            -- optional picker via telescope
            { "nvim-telescope/telescope.nvim" },
            -- optional picker via fzf-lua
            { "ibhagwan/fzf-lua" },
            -- .. or via snacks
            {
                "folke/snacks.nvim",
                opts = {
                    terminal = {},
                }
            }
        },
        event = "LspAttach",
        opts = {},
        config = function()
            require("tiny-code-action").setup({
                picker = {
                    "buffer",
                    opts = {
                        hotkeys = true,
                        hotkeys_mode = 'text_diff_based',
                        winborder = 'rounded',
                    },
                }
            })
            vim.keymap.set({ "n", "x" }, "<leader>ca", function()
                require("tiny-code-action").code_action()
            end, { noremap = true, silent = true })
        end
    }
}
