local M = {}

local cmp = require("cmp")
local timer = vim.loop.new_timer()

local DEBOUNCE_DELAY = 400
local ignored_filetypes = { 'TelescopePrompt', 'Telescope' }

--BUG: Workaround for autocomplete not displaying all options while using performance.debounce and autocomplete
function M.debounce()
    timer:stop()
    timer:start(
        DEBOUNCE_DELAY,
        0,
        vim.schedule_wrap(function()
            local ft = vim.cmd("echo &filetype")
            if not vim.tbl_contains(ignored_filetypes, ft) then
                cmp.complete({ reason = cmp.ContextReason.Auto })
            end
        end)
    )
end

return M
