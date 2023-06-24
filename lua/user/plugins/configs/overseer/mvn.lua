local M = {}

local configs = require("user.plugins.configs.overseer.mvn_configs")

local java_icon = ""

M.clean =
{
    name = java_icon .. " mvn clean",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "clean", configs.ignore_ssl, configs.skip_tests },
        }
    end,
    condition = {
        filetype = { "java" },
    },
    -- callback = function(search)
    --   print(vim.inspect(search))
    -- end,
}

M.package =
{
    name = java_icon .. " mvn package",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "package", configs.ignore_ssl, configs.skip_tests },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

M.test =
{
    name = java_icon .. " mvn test",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "test", configs.ignore_ssl },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}


M.debug_test =
{
    name = java_icon .. " mvn debug test",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "test", configs.ignore_ssl, "-Dmaven.surefire.debug" },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}


M.mvn_failsafe =
{
    name = java_icon .. " mvn verify -Pfailsafe",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "verify", "-Pfailsafe", configs.ignore_ssl },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

M.install =
{
    name = java_icon .." mvn install",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "clean", "install", configs.ignore_ssl, configs.skip_tests },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

M.pit =
{
    name = java_icon .. " Mutation tests with PIT",
    builder = function()
        return {
            cmd = { "mvn" },
            args = { "test-compile", "org.pitest:pitest-maven:mutationCoverage", "-DwithHistory", configs.ignore_ssl },
        }
    end,
    condition = {
        filetype = { "java" },
    },
}

return {
    M.clean,
    M.package,
    M.run,
    M.repackage,
    M.test,
    M.debug_test,
    M.mvn_failsafe,
    M.install,
    M.pit
}
