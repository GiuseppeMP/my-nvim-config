local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.clean =
{
    name = " mvn clean",
    builder = function()
        return {
            strategy = {
                "toggleterm",
                open_on_start = true,
                close_on_exit = true,
                use_shell = true,
                direction = "float",
            },
            cmd = { "mvn" },
            args = { "clean", configs.ignore_ssl, configs.skip_tests },
            components = {
                { "on_complete_dispose", timeout = 30 },
                -- { "on_output_summarize", max_lines = 9 },
                "on_exit_set_status",
            },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.clean
