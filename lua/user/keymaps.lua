local n, v, x, i, t = utils.keymap.n, utils.keymap.v, utils.keymap.x, utils.keymap.i, utils.keymap.t

-- Remap space as leader key --
n("<SPACE>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap esc to use clear search highlights --
n("<esc>", ":noh<CR><esc>")
vim.cmd [[ xnoremap s :s/\%V/g<left><left>]]


-- Normal mode --
--
-- Better window navigation --
n("<C-h>", "<C-w>h")
n("<C-j>", "<C-w>j")
n("<C-k>", "<C-w>k")
n("<C-l>", "<C-w>l")

-- It was fixed in which-key.lua
-- BUG: IIRC terminals always send TAB instead of <C-i>
-- n("<Tab>", "<C-i>")

t("<C-h>", "<C-w>h")
t("<C-j>", "<C-w>j")
t("<C-k>", "<C-w>k")
t("<C-l>", "<C-w>l")

-- Resize with arrows --
n("<S-Up>", ":resize -3<CR>")
n("<S-Down>", ":resize +3<CR>")
n("<S-Left>", ":vertical resize -3<CR>")
n("<S-Right>", ":vertical resize +3<CR>")

t("<S-Up>", ":resize -3<CR>")
t("<S-Down>", ":resize +3<CR>")
t("<S-Left>", ":vertical resize -3<CR>")
t("<S-Right>", ":vertical resize +3<CR>")

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

x("p", '"_dP"')


-- Manter o cursor centralizado.
-- keep the cursor at center while using n,N,k,j,J
n('n', 'nzzzv')
n('{', '{zzzv')
n('}', '}zzzv')
n('N', 'Nzzzv')
-- n('J', 'mzJ`z')
n('k', 'kzz')
n('j', 'jzz')
n('<C-d>', '<C-d>zz')
n('<C-u>', '<C-u>zz')

n('<CR>', 'i<CR><ESC>==')

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
i(';;', '<C-o>A;<CR>')
i(',,', '<C-o>A,')

-- insert ; at end of the line and start new line
-- i(';<Enter>', '<ESC>A;<ESC>o')
-- i(',<Enter>', '<ESC>A,<ESC>o')

i("<c-l>", "<Right>")
i("<c-h>", "<Left>")

-- Helper function to format the current buffer
local function format_buffer()
    vim.lsp.buf.format({ async = true })
end

-- Override normal mode paste `p` and `P`
vim.keymap.set('n', 'p', function()
    vim.api.nvim_feedkeys('p', 'n', false) -- do normal paste
    vim.schedule(format_buffer)            -- schedule formatting after paste
end, { noremap = true })

vim.keymap.set('n', 'P', function()
    vim.api.nvim_feedkeys('P', 'n', false) -- do normal paste
    vim.schedule(format_buffer)
end, { noremap = true })

-- Override visual mode paste
vim.keymap.set('x', 'p', function()
    vim.api.nvim_feedkeys('p', 'x', false) -- visual paste
    vim.schedule(format_buffer)
end, { noremap = true })

vim.keymap.set('x', 'P', function()
    vim.api.nvim_feedkeys('P', 'x', false)
    vim.schedule(format_buffer)
end, { noremap = true })
