local function config()
    local alpha = require("alpha")
    local dashboard = require 'alpha.themes.startify'
    alpha.setup(dashboard.config)
    dashboard.section.top_buttons.val = {
        dashboard.button("s", "Open last session", "<cmd>lua require('persistence').load({ last = true })<cr>"),
        dashboard.button("S", "Load current session", "<cmd>lua require('persistence').load()<cr>"),
        dashboard.button("w", "Select session", "<cmd>lua require('persistence').select()<cr>"),
        dashboard.button("g", "Git", ":G<cr><C-w>o"),
        dashboard.button("gd", "Git diff", ":G diff<cr><C-w>o"),
        dashboard.button("h", "Open Harpoon Menu",
            "<cmd>lua require('harpoon').ui:toggle_quick_menu(require'harpoon':list())<cr>"),
        dashboard.button("q", "Quit", "<cmd>qa!<cr>")
    }
end

return
{
    'goolord/alpha-nvim',
    config = config
}
