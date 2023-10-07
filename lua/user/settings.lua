-- General Settings
--
local o = vim.o -- For the opt
local g = vim.g -- For the globals
-- local w = vim.wo -- For the window local options
-- local b = vim.bo -- For the buffer local options

o.clipboard = 'unnamedplus'
o.list = false
o.autoindent = true
o.cindent = true
o.autoread = true
o.backspace = [[indent,eol,start]]

o.mouse = 'a'
o.termguicolors = true
o.background = 'dark'
o.showmode = true
o.hidden = true
-- o.title = false
o.number = true
o.relativenumber = true
o.showcmd = true
o.backup = false
o.writebackup = false
o.wb = false
o.swapfile = false
o.expandtab = true
o.shiftround = true
o.tabstop = 4
o.shiftwidth = 4
o.foldmethod = 'indent'
o.foldnestmax = 10
o.foldenable = false
o.foldlevel = 2
o.updatetime = 500
o.shortmess = o.shortmess .. 'c'
-- o.shortmess:append({'c'})
o.signcolumn = 'auto'
o.encoding = 'UTF-8'
o.wm = 5
o.scrolloff = 5
o.sidescrolloff = 5
o.history = 200
o.incsearch = true
o.smartcase = true
o.ttyfast = true
o.lazyredraw = false
o.ignorecase = true
o.hlsearch = true
o.showmatch = true
o.compatible = false
o.timeoutlen = 700
o.timeout = true
o.cmdheight = 0
o.ch = 1 -- hide command line
-- o.winbar = "%f"
-- o.winbar = "%=%m %f"
-- o.winbar = "%= %f"
o.spelllang = 'en_us'
o.spell = false
o.cursorline = true
o.laststatus = 3
o.guifont = 'CaskaydiaCove Nerd Font SemiLight:h12'
-- o.guifont='Hack Nerd Font Mono Regular:h12'
-- o.guifont='Fira Code Regular:h12'

-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
