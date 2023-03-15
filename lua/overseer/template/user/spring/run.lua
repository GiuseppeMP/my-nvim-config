local M = {}

M.clean =
{
    name = " spring-boot run",
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

return M.clean
