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

if not vim.g.vscode then
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
    o.updatetime=000
    o.shortmess=o.shortmess..'c'
    o.signcolumn='number'
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
    o.guifont='CaskaydiaCove Nerd Font SemiLight:h12'

end
