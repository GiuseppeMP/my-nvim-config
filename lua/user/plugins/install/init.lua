if vim.g.plugin_manager == 'packer' then
    require "user.plugins.install.setup_packer"

elseif vim.g.plugin_manager == 'vimplug' then
    require "user.plugins.install.setup_vimplug"

elseif vim.g.plugin_manager == 'lazy' then
    require "user.plugins.install.setup_lazy"
end

