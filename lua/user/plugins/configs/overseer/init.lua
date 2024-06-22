local overseer = require("overseer")
local spring_boot_tasks = require("user.plugins.configs.overseer.spring_boot")
local mvn_tasks = require("user.plugins.configs.overseer.mvn")
local robot_tasks = require("user.plugins.configs.overseer.robot_framework")

overseer.setup({
    strategy = {
        "toggleterm",
        -- load your default shell before starting the task
        use_shell = true,
        -- overwrite the default toggleterm "direction" parameter
        direction = "float",
        -- overwrite the default toggleterm "highlights" parameter
        -- highlights = nil,
        -- overwrite the default toggleterm "auto_scroll" parameter
        auto_scroll = true,
        -- have the toggleterm window close automatically after the task exits
        close_on_exit = false,
        -- open the toggleterm window when a task starts
        open_on_start = true,
        -- mirrors the toggleterm "hidden" parameter, and keeps the task from
        -- being rendered in the toggleable window
        hidden = true,
    },
    templates = { "builtin" }
})


for _, spring_boot_task in pairs(spring_boot_tasks) do
    overseer.register_template(spring_boot_task)
end

for _, mvn_task in pairs(mvn_tasks) do
    overseer.register_template(mvn_task)
end

for _, robot_task in pairs(robot_tasks) do
    overseer.register_template(robot_task)
end
