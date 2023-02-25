-- Module that installs the vim plugin list.
-- Modulo que instala os plugins utilizando vimplug
-- You can change the plugin manager by rewritting this module.
local plugins = require("user.plugins.install.plugins_table")


local Plug = vim.fn['plug#']

vim.call('plug#begin', '$HOME/.config/nvim/plugged')

-- TODO tests
for i =1, #plugins do
    local p = plugins[i]
    if not utils.is_empty(p.name) then
        -- Automatically maps plugin table to the vimplug syntax
        Plug(p.name, utils.table_concat(p.spec ,p.plug))
    end
end

vim.call('plug#end')

