-- lua global utils
_G.utils = {}
_G.conf = {}
_G.conf.user = {}
_G.dapui = {}
_G.dapui.current_win = nil

local status_ok, user_conf = pcall(require, "user.conf")
if not status_ok then
    _G.conf.user = {}
else
    _G.conf.user = user_conf
end


-- utils collection https://github.com/rxi/lume
_G.lume = require 'user.utils.lume'

-- pretty print -- https://github.com/jagt/pprint.lua
_G.utils.pprint = require 'user.utils.pprint'.pprint

-- table print
_G.utils.json_print = function(table)
    print(vim.json.encode(table))
end

-- print as json
_G.utils.print_as_json = require 'user.utils.print_as_json'

-- verify if file exists
_G.utils.file_exists = function(path)
    local f = io.open(path, 'r')
    return f ~= nil and io.close(f)
end

-- user customs
require 'user.utils.discipline'.cowboy()
require 'user.utils.buf-only'

-- concat tables
_G.utils.table_concat = function(...) return lume.merge(...) end

_G.utils.is_empty = function(s)
    return s == nil or s == ''
end

_G.utils.keymap = require('user.utils.set_keymaps')

_G.has_non_empty_buffers = function()
    ---@diagnostic disable-next-line: param-type-mismatch
    for _, buf in pairs(vim.fn.getbufinfo({ listed = true })) do
        -- skip unloaded and hidden buffers
        ---@diagnostic disable-next-line: undefined-field
        if buf.loaded and not buf.hidden then
            -- check if buffer is non-empty
            ---@diagnostic disable-next-line: undefined-field
            if vim.fn.line("$", buf.bufnr) > 1 then
                ---@diagnostic disable-next-line: undefined-field
                print("Found non-empty buffer: " .. buf.name)
                return true
            end
        end
    end
    print("No non-empty buffers found")
    return false
end

-- icons used as signs columns
_G.conf.signs = {
    -- error = "",
    error = "",
    warn = "",
    hint = "",
    info = "",
    other = "",
    git = {
        deleted = "",
        modified = '',
        untracked = '',
        added = '',
    }
}

-- icons used in general like files, statusline, decorators etc.
_G.conf.icons = {
    question = '',
    check = '',
    skip = '󰒭',
    check_fa = '',
    repeat_fa = '',
    remove_fa = '',
    pencil = '',
    git = {
        removed = '',
        -- changed = '',
        changed = '',
        added = '',
    }
}

_G.utils.table_contains = function(tbl, element)
    if (tbl == nil) then return false end
    for _, value in pairs(tbl) do
        if string.match(value, element) then
            return true
        end
    end
end

local uname = vim.loop.os_uname()
local sysname = uname.sysname

_G.conf.so = {
    sysname = sysname,
    is_mac = sysname == 'Darwin',
    is_linux = sysname == 'Linux',
    is_windows = sysname:find 'Windows' and true or false,
    is_wsl = uname.release:find 'Microsoft' and true or false
}


-- see: https://www.lua.org/pil/8.4.html
-- error handler used to setup plugins and avoid that theirs errs bubles and breaks entire init.
_G.utils.init_err_handler = function(task_name, task)
    local ok, err = pcall(task)
    if not ok then
        if not utils.is_empty(task_name) then
            print("task|config|setup - [" .. task_name .. "] failed because of:" .. err)
        end
        print(debug.traceback())
        return
    end
end

_G.utils.log = require 'user.utils.log'
