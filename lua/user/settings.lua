-- General Settings
--
local o = vim.o -- For the globals options
-- local w = vim.wo -- For the window local options
-- local b = vim.bo -- For the buffer local options

o.clipboard = 'unnamedplus'
o.list = false
o.autoindent = true
o.autoread = true
o.backspace =  [[indent,eol,start]]

o.mouse = 'a'
o.termguicolors = true
o.background='dark'
o.showmode = true
o.hidden = true
o.title = true
o.number = true
o.relativenumber = true
o.showcmd = true
o.backup = false
o.writebackup = false
o.wb = false
o.swapfile = false
o.expandtab = true
o.tabstop=4
o.shiftwidth=4
o.foldmethod='indent'
o.foldnestmax=10
o.foldenable = false
o.foldlevel=2
o.cmdheight=2
o.updatetime=500
o.shortmess=o.shortmess..'c'
-- o.shortmess:append({'c'})
o.signcolumn='auto'
o.encoding='UTF-8'
o.wm=5
o.scrolloff=5
o.sidescrolloff=5
o.history=200
o.incsearch = true
o.ignorecase = true
o.hlsearch = true
o.showmatch = true
o.compatible = false
o.laststatus = 3
o.timeoutlen = 700
o.timeout= true
-- o.ls = 0 -- hide status line
-- o.ch = 0 -- hide command line
o.spelllang = 'en_us'
o.spell = false
o.cursorline = true
o.guifont='CaskaydiaCove Nerd Font SemiLight:h12'

vim.opt.laststatus = 3
