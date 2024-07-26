local function config()
    -- get Workspace from env var NVIM_OBSIDIAN_VAULTS
    -- NVIM_OBSIDIAN_VAULTS is a string with workspaces separated by comma
    -- Ex: NVIM_OBSIDIAN_VAULTS="path/workspace1,path/workspace2"
    local obsidian_vaults = os.getenv "NVIM_OBSIDIAN_VAULTS"

    local templateFolder = "Obsidian/Templates/Neovim"

    local path = require "plenary.path"

    local function file_exists(file)
        -- some error codes:
        -- 13 : EACCES - Permission denied
        -- 17 : EEXIST - File exists
        -- 20	: ENOTDIR - Not a directory
        -- 21	: EISDIR - Is a directory
        local isok, errstr, errcode = os.rename(file, file)
        if isok == nil then
            if errcode == 13 then
                -- Permission denied, but it exists
                return true
            end
            print("Can't config Obsidian because " .. file .. " does not exist.")
            return false
        end
        return true
    end

    local function dir_exists(check)
        return file_exists(check .. "/")
    end

    if obsidian_vaults == nil then
        return
    end

    local templateDir = (obsidian_vaults .. "/" .. templateFolder)

    if dir_exists(templateDir) == false then
        return
    end

    local function getObsidianWorkspaces()
        local vaults = {}
        if obsidian_vaults then
            for vault in obsidian_vaults:gmatch('[^,%s]+') do
                local w = { name = vault, path = vault }
                table.insert(vaults, w)
            end
        end
        return vaults
    end

    -- This is how I use Obsidian
    -- You can customize as you wish
    require 'obsidian'.setup {
        workspaces = getObsidianWorkspaces(),
        -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
        completion = {
            -- Set to false to disable completion.
            nvim_cmp = true,
            -- Trigger completion at 2 chars.
            min_chars = 3,
        },
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "Journals",
            -- Optional, if you want to change the date format for the ID of daily notes.
            -- Ex: Journals/2024/01-January/2024-January-01-Sunday.md
            -- https://linux.die.net/man/3/strftime
            -- For use in Obsidian App format = Y/MM-MMMM/WW-\w\e\e\k/Y-MM-DD-ddd
            date_format = "%Y/%m-%B/%F-%a",
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = "%B %-d, %Y",
            template = "DailyNvim.md"
        },
        templates = {
            subdir = templateFolder,
            date_format = "%F-%a-note",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function
            substitutions = {
                yesterday_note = function()
                    return os.date("%Y/%m-%B/F-%a", os.time() - 86400)
                end,
                today_note = function()
                    return os.date("%Y/%m-%B/F-%a")
                end,
                -- Get Things Done note of the month
                gtd = function()
                    return os.date("Journals/%Y/%m-%B/%Y-%m-Get Things Done")
                end,
                daily_toc_title = function()
                    return os.date("#📆 %F|📆 %F")
                end,
                daily_toc_idx = function()
                    return os.date("#📆 %F")
                end,
                -- The year as a decimal number including the century.
                Y = function()
                    return os.date("%Y")
                end,
                -- The year as a decimal number without a century (range 00 to 99).
                y = function()
                    return os.date("%y")
                end,
                -- Equivalent to %Y-%m-%d (the ISO 8601 date format). (C99)
                F = function()
                    return os.date("%F")
                end,
                -- The full weekday name according to the current locale.
                A = function()
                    return os.date("%A")
                end,
                -- The abbreviated weekday name according to the current locale.
                a = function()
                    return os.date("%a")
                end,
                -- The minute as a decimal number (range 00 to 59).
                M = function()
                    return os.date("%M")
                end,
                -- The month as a decimal number (range 01 to 12).
                m = function()
                    return os.date("%m")
                end,
                -- The full month name according to the current locale.
                B = function()
                    return os.date("%B")
                end,
                -- The abbreviated month name according to the current locale.
                b = function()
                    return os.date("%b")
                end,
                V = function()
                    return os.date("%V")
                end

            },
        },
        -- Optional, boolean or a function that takes a filename and returns a boolean.
        -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
        disable_frontmatter = true,

        -- Optional, alternatively you can customize the frontmatter data.
        note_frontmatter_func = function(note)
            -- This is equivalent to the default frontmatter function.
            local out = { id = note.id, aliases = note.aliases, tags = note.tags }
            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end
            return out
        end,
    }
end
return {
    "epwalsh/obsidian.nvim",
    tag = 'v2.5.3',
    ft = { "markdown", "alpha" },
    config = config,
    dependencies = {
        "nvim-lua/plenary.nvim",
    }
}
