local M = {}

-- winbar ignore
M.winbar_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "alpha",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "Jaq",
    "harpoon",
    "dapui_scopes",
    "dapui_breakpoints",
    "dapui_stacks",
    "dapui_watches",
    "dap-repl",
    "dap-terminal",
    "dapui_console",
    "lab",
    "Markdown",
    "",
}

M.get_filename = function()
    local filename = vim.fn.expand "%:t"
    local extension = vim.fn.expand "%:e"
    local f = require "user.functions"

    if not f.isempty(filename) then
        local file_icon, file_icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

        local hl_group = "FileIconColor" .. extension

        vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })

        if f.isempty(file_icon) then
            file_icon = ""
            file_icon_color = ""
        end

        -- return " " .. "%=%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*" .. " "
        return " " .. "%#" .. hl_group .. "#" .. file_icon .. " %*" .. " " .. "%#Winbar#" .. filename .. "%*" .. " "
    end
end


local excludes = function()
    if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
        vim.opt_local.winbar = nil
        return true
    end
    return false
end

M.get_winbar = function()
    if excludes() then
        return
    end
    local value = M.get_filename()
    pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
end

M.create_winbar = function()
    vim.api.nvim_create_augroup("_winbar", {})
    vim.api.nvim_create_autocmd(
        { "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
        {
            group = "_winbar",
            callback = function()
                require("user.winbar").get_winbar()
            end,
        }
    )
end

--disabled temporarily because of incline.nvim
-- M.create_winbar()

return M
