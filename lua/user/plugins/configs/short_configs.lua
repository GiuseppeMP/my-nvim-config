local n = utils.keymap.n

-- Module of short keymaps of simple plugins
-- Modulo que faz keymaps curtos de plugins simples.

vim.g.rainbow_active=1

-- https://github.com/unblevable/quick-scope
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- https://github.com/preservim/tagbar
n("<C-w><C-t>",":TagbarToggle<CR>")

-- neovide configs
vim.g.neovide_cursor_vfx_mode = "railgun"


