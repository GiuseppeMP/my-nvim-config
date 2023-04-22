local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.clean =
{
    name = " mvn install",
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "install", configs.ignore_ssl, configs.skip_tests },
            components = require 'overseer.template.user.commons'.components,
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.clean
