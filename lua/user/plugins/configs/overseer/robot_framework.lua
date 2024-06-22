--[[
IMPORTANT: variable DEV or QA should be configured at credentials files
*/]]
     --

local M = {}

M.robot_dev = {
    name = "robot dev",
    builder = function()
        local file = vim.fn.expand("%:p")
        return {
            cmd = { "robot" },
            args = { "--variable", "ENV:DEV", "--outputdir", "./logs", file },
        }
    end,
    condition = {
        filetype = { "robot" },
    },
}

M.robot_qa = {
    name = "robot qa",
    builder = function()
        local file = vim.fn.expand("%:p")
        return {
            cmd = { "robot" },
            args = { "--variable", "ENV:QA", "--outputdir", "\"./logs\"", file },
        }
    end,
    condition = {
        filetype = { "robot" },
    },
}

return {
    M.robot_dev,
    M.robot_qa
}
