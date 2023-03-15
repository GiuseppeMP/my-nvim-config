local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.clean =
{
    name = " mvn clean",
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "clean", configs.ignore_ssl, configs.skip_tests },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.clean
