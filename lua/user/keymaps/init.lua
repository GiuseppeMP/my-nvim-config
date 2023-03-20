local n, v, x, i = utils.keymap.n, utils.keymap.v, utils.keymap.x, utils.keymap.i

-- Remap space as leader key --
n("<SPACE>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap esc to use clear search highlights --
n("<esc>", ":noh<CR><esc>")

-- Normal mode --
--
-- Better window navigation --
n("<C-h>", "<C-w>h")
n("<C-j>", "<C-w>j")
n("<C-k>", "<C-w>k")
n("<C-l>", "<C-w>l")

-- Resize with arrows --
n("<C-Up>", ":resize -2<CR>")
n("<C-Down>", ":resize +2<CR>")
n("<C-Left>", ":vertical resize -2<CR>")
n("<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers --
n("<S-l>", ":bnext<CR>")
n("<S-h>", ":bprevious<CR>")

-- Insert opts --
--
i("jk", "<ESC>")

-- Visual mode --
--
-- Stay in indent selection
v("<", "<gv")
v(">", ">gv")

-- Move visual selection up and down
-- k("v", "A-j", ":m .+1<CR>==", opts)
-- k("v", "A-k", ":m .-2<CR>==", opts)
x("p", '"_dP"')

-- Manter o cursor centralizado.
-- keep the cursor at center while using n,N,k,j,J
n('n', 'nzzzv')
n('N', 'Nzzzv')
n('J', 'mzJ`z')
n('k', 'kzz')
n('j', 'jzz')

n('<CR>', 'i<CR><ESC>')

-- Create breakpoints to not lost all the stuff in the undo
-- Criando breakpoints durante insert mode para n perder textos no undo
i(',', ',<c-g>u')
i('.', '.<c-g>u')
i('!', '!<c-g>u')
i('?', '?<c-g>u')
i('(', '(<c-g>u')
i('[', '[<c-g>u')
i('{', '{<c-g>u')
i('}', '}<c-g>u')

-- insert ; at end of the line
i(';;', '<C-o>A;')
i(',,', '<C-o>A,')

-- insert ; at end of the line and start new line
i(';<Enter>', '<ESC>A;<ESC>o')
i(',<Enter>', '<ESC>A,<ESC>o')

i("<c-l>", "<Right>")
i("<c-h>", "<Left>")
