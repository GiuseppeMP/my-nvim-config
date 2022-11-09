require("neotest").setup({
  adapters = {
    require("neotest-vim-test")({ ignore_filetypes = { "python", "lua" }, allow_file_types = { "java" } }),
    require("neotest-plenary"),
  }
})
