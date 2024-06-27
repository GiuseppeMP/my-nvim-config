return {
    {
        "GiuseppeMP/blanket.nvim",
        lazy = false,
        -- config = function()
        --     require("blanket").setup({
        --         -- can use env variables and anything that could be interpreted by expand(), see :h expandcmd()
        --         -- OPTIONAL
        --         report_path = vim.fn.getcwd() .. "/target/site/jacoco/jacoco.xml",
        --         -- refresh gutter every time we enter java file
        --         -- defauls to empty - no autocmd is created
        --         filetypes = "java",
        --         -- for debugging purposes to see whether current file is present inside the report
        --         -- defaults to false
        --         silent = true,
        --         -- can set the signs as well
        --         signs = {
        --             priority = 10,
        --             incomplete_branch = "┃",
        --             uncovered = "┃",
        --             covered = "┃",
        --             sign_group = "Blanket",

        --             -- and the highlights for each sign!
        --             -- useful for themes where below highlights are similar
        --             incomplete_branch_color = "yellow",
        --             covered_color = "green",
        --             uncovered_color = "Error",
        --         },

        --     })
        -- end
    },
    {
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("coverage").setup() end
    }
}
