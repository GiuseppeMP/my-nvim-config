return {
    {
        "folke/trouble.nvim",
        event = 'VeryLazy',
        config = function()
            require 'trouble'.setup {
                signs = {
                    error = conf.signs.error,
                    warning = conf.signs.warn,
                    hint = conf.signs.hint,
                    information = conf.signs.info,
                    other = conf.signs.other
                },
                win = {
                    size = 0.25,
                    wo = {
                        wrap = true,
                    },
                },
            }
        end,
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>ks",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>kl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
}
