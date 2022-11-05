" nvim general settings and options
lua require("user.settings")

" nvim keymaps
lua require("user.keymaps")

" nvim plugins installs, configs, and keymaps
lua require("user.plugins")

" nvim theme
lua require("user.colorscheme")

" nvim autocmds
lua require("user.autocmds")

" nvim testing enviroment (all configs for testing/tdd)
lua require('user.testing')

" nvim compatibility with wsl2(windows)
lua require('user.wsl')
