local M = {}
local plenary_reload = require("plenary.reload")

function M.plenary(name)
    plenary_reload.reload_module(name)
    return require(name)
end

function M.reload()
    local function get_module_name(s)
        local module_name;
        module_name = s:gsub("%.lua", "")
        module_name = module_name:gsub("%/", ".")
        module_name = module_name:gsub("%.init", "")
        return module_name
    end

    local prompt_title = "~ ✨ your neovim modules ✨ ~"

    -- sets the path to the lua folder
    local path = "~/.config/nvim/lua"

    local opts = {
        prompt_title = prompt_title,
        cwd = path,

        attach_mappings = function(_, map)
            -- Adds a new map to ctrl+r reload.
            map("i", "<c-r>", function(_)
                local entry = require("telescope.actions.state").get_selected_entry()
                local name = get_module_name(entry.value)

                print(name .. " reloaded!")
                if name ~= nil then
                    M.plenary(name)
                end
            end)

            return true
        end
    }

    -- call the builtin method to list files
    require('telescope.builtin').find_files(opts)
end

return M;
