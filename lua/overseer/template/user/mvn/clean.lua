local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.clean =
{
    name = " mvn clean",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "clean", configs.ignore_ssl, configs.skip_tests },
            components = require 'overseer.template.user.commons'.components,
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.clean
