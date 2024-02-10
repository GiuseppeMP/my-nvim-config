-- change <version>1.1.1</version> to <version>${version}</version> and add to </properties>
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "pom.xml",
    command =
    "nnoremap <leader>v 0/art<cr>yit/ver<cr>\"kcit${<esc>pa.version}<esc>?properties<cr>O<<esc>pa.version><esc>\"kpa</<esc>pa.version><esc><c-o><esc>/<depen<cr><esc>"
})
