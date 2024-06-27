return
{
    "zbirenbaum/copilot-cmp",
    dependencies = "zbirenbaum/copilot.lua",
    cond = function() return conf.user.copilot.enabled end,
    config = function()
        require 'copilot_cmp'.setup()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
    end
}
