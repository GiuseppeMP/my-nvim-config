local function config()
    local status_ok, dressing = pcall(require, "dressing")
    if not status_ok then
        return
    end

    dressing.setup({

        input = {
            enabled = false,
            relative = "cursor",
            -- relative = "editor",
            prefer_width = 100,
            width = nil,
            -- min_width and max_width can be a list of mixed types.
            -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
            max_width = { 140, 0.9 },
            min_width = { 20, 0.2 },
            win_options = {
                winblend = 0,
            },
            get_config = function()
                if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
                    return { enabled = false }
                end
            end,
        },

        select = {
            -- backend = { "telescope", "nui", "builtin" },
            border = "rounded",
            get_config = function(opts)
                if opts.kind == "codeaction" then
                    return {
                        telescope = require("telescope.themes").get_cursor(),
                    }
                end
            end,
        }

    })
end
return {
    { 'stevearc/dressing.nvim', enabled = true, lazy = false, config = config },
}
