local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- convert plugins list into plugins table for lazy setup
local get_plugins = function()
    local plugins, plugins_lazy = require("user.plugins.install.plugins"), {}

    for i = 1, #plugins do
        local p = plugins[i]

        if not utils.is_empty(p.name) then
            -- merge all configs, plugin name, commons specs, and packer configs
            table.insert(plugins_lazy, utils.table_concat({ p.name }, p.spec or {}, p.lazy or {}))
        end
    end

    return plugins_lazy
end

require("lazy").setup(get_plugins())
