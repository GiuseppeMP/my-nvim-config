-- Module of Nerdtree configs and keymaps
-- Modulo de configuracoes e keymaps do Nerdtree
local kutils = require "user.keymaps._utils"
local n = kutils.n

-- nexpr( '<Leader>n', function() return vim.g.NERDtree.isOpen() == 1 and ":NerdTreeToggle<CR>" or ":NerdTreeFind<CR>" end)


n( '<C-n>', ':NERDTreeToggle<CR>')
n( '<C-f>', ':NERDTreeFind<CR>')

vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'
vim.g.NERDTreeShowHidden=1
vim.g.NERDTreeMapActivateNode = 'l'

vim.NERDTreeMapOpenInTab = 'yes'

vim.NERDTreeQuitOnOpen=0

vim.NERDTreeShowBookmarks=1

vim.NERDTreeWinSize=120

