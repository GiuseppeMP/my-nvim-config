local M = {}

local cmp = require("cmp")
local timer = vim.loop.new_timer()

local DEBOUNCE_DELAY = 750

--BUG: Workaround for autocomplete not displaying all options while using performance.debounce and autocomplete
function M.debounce()
    timer:stop()
    timer:start(
        DEBOUNCE_DELAY,
        0,
        vim.schedule_wrap(function()
            cmp.complete()
            -- cmp.complete({ reason = cmp.ContextReason.Auto })
        end)
    )
end

return M
