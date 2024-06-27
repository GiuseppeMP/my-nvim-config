return
{
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufEnter" },
    config = function()
        require("gx").setup {
            open_browser_app = conf.so.is_mac and "open" or "xdg-open",
            handlers = {
                plugin = true,           -- open plugin links in lua (e.g. packer, lazy, ..)
                github = true,           -- open github issues
                package_json = true,     -- open dependencies from package.json
            },
            handler_options = {
                search_engine = "google",     -- you can select between google, bing and duckduckgo
            },
        }
    end,
}
