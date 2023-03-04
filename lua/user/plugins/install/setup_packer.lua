-- Module that installs the vim plugin list.
-- You can change the plugin manager by rewritting this module.
local plugins = require("user.plugins.install.plugins")


local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


require'packer'.startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Automatically maps plugin table to the packer use syntax
    for i =1, #plugins do

        local p = plugins[i]
        if not utils.is_empty(p.name) then
            -- merge all configs, plugin name, commons specs, and packer configs
            use(utils.table_concat({ p.name }, p.spec or {}, p.packer or {}))
        end
    end

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

end)
