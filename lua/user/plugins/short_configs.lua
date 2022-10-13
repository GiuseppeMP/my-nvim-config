local kutils = require "user.keymaps.utils"
local n = kutils.n

-- Module of short keymaps of simple plugins
-- Modulo que faz keymaps curtos de plugins simples.

vim.g.rainbow_active=1

-- https://github.com/unblevable/quick-scope
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- https://github.com/preservim/tagbar
n("<C-w><C-t>",":TagbarToggle<CR>")

-- https://github.com/voldikss/vim-floaterm
n('<c-f><c-f>',':FloatermNew<CR>')

-- neovide configs
vim.g.neovide_cursor_vfx_mode = "railgun"


