-- Module that installs the vim plugin list.
-- Modulo que instala os plugins utilizando vimplug
-- You can change the plugin manager by rewritting this module.
local plugins = require("user.plugins.install._list")

local function isempty(s)
  return s == nil or s == ''
end

local Plug = vim.fn['plug#']

vim.call('plug#begin', '$HOME/.config/nvim/plugged')

for _, v in pairs(plugins) do
    if not isempty(v.name) then
        if (isempty(v.cfg)) then
            Plug(v.name)
        else
            Plug(v.name, v.cfg)
        end
    end
end

vim.call('plug#end')

