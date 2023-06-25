local M = {}

M.run =
{
    name = " mvn spring-boot:run",
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
        filetype = { "java", "xml" },
    },
}

M.dev =
{
    name = " mvn spring-boot:run -Dspring-boot.run.properties=local,dev",
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "spring-boot:run", "-Dapp.profiles=local,dev" },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java", "xml" },
    },
}

M.test =
{
    name = " mvn spring-boot:run -Dspring-boot.run.properties=test",
    builder = function()
        -- Full path to current file (see :help expand())
        -- local file = vim.fn.expand("%:p")
        return {
            cmd = { "mvn" },
            args = { "spring-boot:run", "-Dapp.profiles=test" },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java", "xml" },
    },
}

M.repackage =
{
    name = " mvn spring-boot:repackage",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "spring-boot:repackage" },
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "java", "xml" },
    },
}

return { M.run, M.repackage, M.dev, M.test }
