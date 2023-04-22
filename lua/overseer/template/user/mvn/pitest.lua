local M = {}
local configs = require 'overseer.template.user.mvn.configs'

M.mvn_pitest =
{
    name = " mvn pitest",
    strategy = { "toggleterm", open_on_start = true, close_on_exit = false },
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "test-compile", "org.pitest:pitest-maven:mutationCoverage", "-DwithHistory", configs.ignore_ssl },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return M.mvn_pitest
