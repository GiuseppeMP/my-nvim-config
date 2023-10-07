-- #22668 adds lua-loader. A builtin Lua module which byte-compiles and caches Lua files (speeds up load times). To enable, add vim.loader.enable() to your init.lua.
vim.loader.enable()

-- init vim
--
-- utils functions
require("user.utils")

require("user.settings")

require("user.plugins")

require("user.colorscheme")

require("user.autocmds")

require('user.winbar')

require('user.wsl')

require("user.keymaps")

require("user.colemak")
