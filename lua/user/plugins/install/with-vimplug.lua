-- Module that installs the vim plugin list.
-- Modulo que instala os plugins utilizando vimplug
-- You can change the plugin manager by rewritting this module.
local plugins = require("user.plugins.install._list")

local function isempty(s)
  return s == nil or s == ''
end

local Plug = vim.fn['plug#']

vim.call('plug#begin', '$HOME/.config/nvim/plugged')

for i =1, #plugins do 
    local p = plugins[i]
    if not isempty(p.name) then
        if (isempty(p.cfg)) then
            Plug(p.name)
        else
            Plug(p.name, p.cfg)
        end
    end
end

vim.call('plug#end')

