return {
    {
        "kiyoon/jupynium.nvim",
        build = "pip3 install --user .",
        config = function() require("jupynium").setup {} end,
        -- build = "conda run --no-capture-output -n jupynium pip install .",
        -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),

    },
}
