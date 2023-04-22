local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.mvn_failsafe =
{
    name = " mvn verify -Pfailsafe",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "verify", "-Pfailsafe", configs.ignore_ssl },
            components = require 'overseer.template.user.commons'.components,
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.mvn_failsafe
