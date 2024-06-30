-- #22668 adds lua-loader. A builtin Lua module which byte-compiles and caches Lua files (speeds up load times). To enable, add vim.loader.enable() to your init.lua.
vim.loader.enable()

require("user.utils")

require("user.settings")

require("user.keymaps")

require("user.lazy")

require("user.autocmds")

require('user.winbar')

require('user.wsl')

require("user.colemak")

require("user.colorscheme")

require("user.macros")
