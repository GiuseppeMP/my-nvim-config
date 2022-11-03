require("neotest").setup({
  adapters = {
    require("neotest-vim-test")({ ignore_filetypes = { "python", "lua" } }),
    require("neotest-plenary"),
  }
})
