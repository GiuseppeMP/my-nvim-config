if vim.g.plugin_manager == 'packer' then
    require "user.plugins.install.setup_packer"

elseif vim.g.plugin_manager == 'vimplug' then
    require "user.plugins.install.setup_vimplug"
end

