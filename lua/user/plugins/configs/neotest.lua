require("neotest").setup({
    adapters = {
        require("neotest-plenary"),
        require("neotest-vim-test")({ ignore_filetypes = { "python", "lua" }, allow_file_types = { "java" } }),
        require("neotest-python")(
            {
                dap = { justMyCode = true },
                args = {"--log-level", "DEBUG"},
            }
        )
    }
})
