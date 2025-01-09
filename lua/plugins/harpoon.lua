local telescope_state = require("telescope.actions.state")
local telescope_finders = require("telescope.finders")
local telescope_pickers = require("telescope.pickers")
local harpoon_get_paths = function(files)
    local paths = {}
    local items = files.items
    local len = files._length

    for i = 1, len do
        paths[i] = ''
        local item = items[i]
        if item ~= nil then
            paths[i] = item.value
        end
    end

    return paths
end

local function harpoon_make_finder(paths)
    return telescope_finders.new_table({ results = paths })
end

local function config()
    local harpoon = require 'harpoon'
    harpoon:setup()
    ---@type HarpoonList
    local term_list = harpoon:list("terms") -- note the : instead of .

    ---@return string name of the created terminal
    local function create_terminal()
        vim.cmd("terminal")
        local buf_id = vim.api.nvim_get_current_buf()
        return vim.api.nvim_buf_get_name(buf_id)
    end

    ---@param index number: The index of the terminal to select.
    local function select_term(index)
        if index > term_list:length() then
            create_terminal()
            print("Creating terminal", index)
            -- just append the newly open terminal
            term_list:add() -- using add() as append() is depricated
        else
            -- find in list
            print("selecting terminal", index)
            term_list:select(index)
        end
    end

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end
        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_buffer_number, map)
                -- map("i", "<C-g>", function()
                --     toggle_telescope(harpoon:list())
                -- end)
                -- map("i", "<C-x>", function()
                --     local selected_entry = telescope_state.get_selected_entry()
                --     local current_picker = telescope_state.get_current_picker(prompt_buffer_number)
                --     harpoon:list():remove_at(selected_entry.index)
                --     current_picker:refresh(harpoon_make_finder(harpoon_get_paths(harpoon:list())))
                -- end)
                return true
            end
        }):find()
    end
    -- basic telescope configuration

    vim.keymap.set("n", "<C-g>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<leader>kt", function() select_term(1) end, { desc = "Select harpoon term 1" })
end
return {
    { 'ThePrimeagen/harpoon', config = config, branch = 'harpoon2' },
}
