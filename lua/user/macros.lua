vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "pom.xml",
    desc = "Extract version to constant maven property variable.",
    command =
    "nnoremap crv 0/art<cr>yit/ver<cr>\"kcit${<esc>pa.version}<esc>?properties<cr>O<<esc>pa.version><esc>\"kpa</<esc>pa.version><esc><c-o><esc>/<version<cr><esc>("
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "pom.xml",
    desc = "Extract constant maven property variable.",
    command =
    "nnoremap crc \"kyi{?</properties<cr>O<<esc>\"kpa></<esc>\"kpa><esc>cit<esc>p<c-o>"
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "pom.xml",
    desc = "Add docstring of mvnrepository artifact page.",
    command =
    "nnoremap crm 0/groupId<cr>\"kyit/artif<cr>\"jyit<esc>?depe<cr>O<!-- https://mvnrepository.com/artifact/<esc>\"kpa/<esc>\"jpa --><esc>=="
})
