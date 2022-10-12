local function k(mode, key, map)
   local opts = { noremap = true, silent = true }
   vim.api.nvim_set_keymap(mode,key, map, opts)
end

-- Modes
--     n: normal only
--     v: visual and select
--     o: operator-pending
--     x: visual only
--     s: select only
--     i: insert
--     c: command-line
--     l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

local function n(key, map)
   k("n",key, map)
end

local function i(key, map)
   k("i",key, map)
end

local function v(key, map)
   k("v",key, map)
end

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
v("<" ,"<gv")
v(">" ,">gv")

-- Move visual selection up and down
-- k("v", "A-j", ":m .+1<CR>==", opts)
-- k("v", "A-k", ":m .-2<CR>==", opts)
v("p", '"_dP"')



-- Manter o cursor centralizado.
-- keep the cursor at center while using n,N,k,j,J
n('n', 'nzzzv')
n('N', 'Nzzzv')
n('J', 'mzJ`z')
n('k', 'kzz')
n('j', 'jzz')


-- Create breakpoints to not lost all the stuff in the undo
-- Criando breakpoints durante insert mode para n perder textos no undo
i( ',', ',<c-g>u')
i( '.', '.<c-g>u')
i( '!', '!<c-g>u')
i( '?', '?<c-g>u')
i( '(', '(<c-g>u')
i( '[', '[<c-g>u')
i( '{', '{<c-g>u')
i( '}', '}<c-g>u')
