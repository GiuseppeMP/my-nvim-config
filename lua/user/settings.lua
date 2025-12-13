--
-- General Settings
--
local o = vim.opt -- For the opt
local g = vim.g   -- For the globals
local wo = vim.wo -- For the window local options
local dot = "·"
local border_fillchar = {
    horiz     = '─',
    horizup   = '┴',
    horizdown = '┬',
    vert      = '│',
    vertleft  = '┤',
    vertright = '├',
    verthoriz = '┼',
}
--local border_bold = = {
--     horiz     = '━',
--     horizup   = '┻',
--     horizdown = '┳',
--     vert      = '┃',
--     vertleft  = '┫',
--     vertright = '┣',
--     verthoriz = '╋',
-- }
-- local b = vim.bo -- For the buffer local options

o.termsync = true
-- o.textwidth = 80
-- o.colorcolumn = "80"
o.completeopt = "menu,menuone,noinsert"
o.clipboard = 'unnamedplus'
o.autoindent = true
o.cindent = true
o.autoread = true
o.backspace = [[indent,eol,start]]
o.mouse = 'a'
o.termguicolors = true
o.background = 'dark'
o.showmode = true
o.hidden = true
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
-- o.shortmess = o.shortmess .. 'cWt'
o.signcolumn = 'auto'
-- o.signcolumn = 'auto:1-2'
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
o.ch = 0 -- hide command line
o.spelllang = 'en,pt'
o.spell = false
o.cursorline = true
o.laststatus = 3
o.guifont = 'Lilex Nerd Font Mono'
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
o.list = true
o.listchars:append {
    multispace = dot,
    space = dot,
    lead = " ",
    eol = "↲",
    tab = "» ",
    nbsp = "␣",
    trail = dot,
    extends = "›",
    precedes = "‹",
}

o.fillchars = border_fillchar
o.winborder = "rounded"
-- wo.border = "rounded"
