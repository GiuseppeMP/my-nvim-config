local M = {}

local nvimrc = require 'user.utils.vimrc_json'.load()

-- n('J', 'mzJ`z')
-- n('k', 'kzz')
-- n('j', 'jzz')
function M.cowboy()
    if (nvimrc.global ~= nil and nvimrc.global.cowboy == false) then
        return
    end

    ---@type table?
    local id
    local ok = true
    for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
        local count = 0
        local timer = assert(vim.loop.new_timer())
        local map = key
        vim.keymap.set("n", key, function()
            if vim.v.count > 0 then
                count = 0
            end
            if (map == 'j' or map == 'k') then
                map = map .. 'zz'
            end
            if count >= 15 then
                ok, id = pcall(vim.notify, " ✋ Hold it Cowboy!", vim.log.levels.WARN, {
                    icon = "🤠",
                    replace = id,
                    keep = function()
                        return count >= 15
                    end,
                })
                if not ok then
                    id = nil
                    return map
                end
            else
                count = count + 1
                timer:start(2000, 0, function()
                    count = 0
                end)
                return map
            end
        end, { expr = true, silent = true })
    end
end

return M
