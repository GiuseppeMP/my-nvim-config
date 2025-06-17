local plugin_dev_path = "~/wsp/oss/cucumber.nvim"

local function dir_exists(path)
    local abs_path = vim.fn.fnamemodify(path, ":p")
    return vim.loop.fs_stat(abs_path)
end

local config = { "GiuseppeMP/cucumber.nvim" }

if (dir_exists(plugin_dev_path)) then
    config = {
        dir = "~/wsp/oss/cucumber.nvim",
        config = function()
            require("cucumber")
        end
    }
end

return config
