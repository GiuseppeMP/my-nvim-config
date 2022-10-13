-- Module of Nerdtree configs and keymaps
-- Modulo de configuracoes e keymaps do Nerdtree
local kutils = require "user.keymaps.utils"
local n = kutils.n
local ne = kutils.ne


local exp = "g:NERDTree.IsOpen() ? :NERDTreeClose<CR> : bufexists(expand('%')) ? :NERDTreeFind<CR> : :NERDTreeToogle<CR>"

local function nerdtreeOpen()
    print('teste')
end

ne( "<Leader>n", nerdtreeOpen)


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

