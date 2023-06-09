local M = {}

M.run =
{
    name = " spring-boot:run",
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "spring-boot:run" },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

M.repackage =
{
    name = " spring-boot:repackage",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "spring-boot:repackage" },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return { M.run, M.repackage }
