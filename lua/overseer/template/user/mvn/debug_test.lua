local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.clean =
{
    name = " mvn debug test",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "test", configs.ignore_ssl, "-Dmaven.surefire.debug" },
            components = require 'overseer.template.user.commons'.components,
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.clean
