local function config()
    require "plugins.overseer.setup"
end

return {
    {
        'stevearc/overseer.nvim',
        config = config
    },
}
