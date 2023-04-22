local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.mvn_pitest =
{
    name = " Mutation tests with PIT",
    strategy = { "toggleterm", open_on_start = true, close_on_exit = false },
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "test-compile", "org.pitest:pitest-maven:mutationCoverage", "-DwithHistory", configs.ignore_ssl },
            components = require 'overseer.template.user.commons'.components,
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.mvn_pitest
