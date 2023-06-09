local M = {}

local configs = require("user.plugins.configs.overseer.mvn_configs")

M.clean =
{
    name = " mvn clean",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "clean", configs.ignore_ssl, configs.skip_tests },
            -- components = require 'overseer.template.user.commons'.components,
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

M.package =
{
    name = " mvn package",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "package", configs.ignore_ssl, configs.skip_tests },
            -- components = require 'overseer.template.user.commons'.components,
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return { M.run, M.repackage }
