local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.clean =
{
    name = " mvn test",
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "test", configs.ignore_ssl },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.clean
