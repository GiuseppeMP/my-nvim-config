local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.mvn_package =
{
    name = " mvn package",
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "package", configs.ignore_ssl, configs.skip_tests },
            components = require 'overseer.template.user.commons'.components,
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.mvn_package
