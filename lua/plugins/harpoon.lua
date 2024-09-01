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
        }):find()
    end
    -- basic telescope configuration

    vim.keymap.set("n", "<C-g>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<leader>kt", function() select_term(1) end, { desc = "Select harpoon term 1" })
end
return {
    { 'ThePrimeagen/harpoon', config = config, branch = 'harpoon2' },
}
