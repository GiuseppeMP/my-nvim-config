local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.clean =
{
    name = " mvn debug test",
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "test", configs.ignore_ssl, "-Dmaven.surefire.debug" },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.clean
