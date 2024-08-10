local function config()
    local alpha = require("alpha")
    local dashboard = require 'alpha.themes.startify'
    alpha.setup(dashboard.config)
    dashboard.section.top_buttons.val = {
        dashboard.button("s", "Open last [s]ession", "<cmd>lua require('persistence').load({ last = true })<cr>"),
        dashboard.button("S", "Load current [S]ession", "<cmd>lua require('persistence').load()<cr>"),
        dashboard.button("c", "[c]hange session", "<cmd>lua require('persistence').select()<cr>"),
        dashboard.button("g", "Lazy[g]it", "<cmd>LazyGit<cr>"),
        dashboard.button("h", "Open [h]arpoon",
            "<cmd>lua require('harpoon').ui:toggle_quick_menu(require'harpoon':list())<cr>"),
        dashboard.button("Q", "[Q]uit", "<cmd>qa!<cr>")
    }
end

return
{
    'goolord/alpha-nvim',
    config = config
}
