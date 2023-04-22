local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.mvn_failsafe =
{
    name = " mvn verify -Pfailsafe",
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "verify", "-Pfailsafe", configs.ignore_ssl },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.mvn_failsafe
