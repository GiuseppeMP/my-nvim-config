-- lua global utils
_G.utils = {}
_G.conf = {}

-- utils collection https://github.com/rxi/lume
_G.lume = require 'user.utils.lume'

-- pretty print -- https://github.com/jagt/pprint.lua
_G.utils.pprint = require 'user.utils.pprint'.pprint

-- print as json
_G.utils.print_as_json = require 'user.utils.print_as_json'

-- verify if file exists
_G.utils.file_exists = function(path)
    local f = io.open(path, 'r')
    return f ~= nil and io.close(f)
end

-- concat tables
_G.utils.table_concat = function(...) return lume.merge(...) end

_G.utils.is_empty = function(s)
    return s == nil or s == ''
end

_G.utils.keymap = require('user.utils.set_keymaps')

_G.has_non_empty_buffers = function()
    for _, buf in ipairs(vim.fn.getbufinfo({ listed = true })) do
        -- skip unloaded and hidden buffers
        if buf.loaded and not buf.hidden then
            -- check if buffer is non-empty
            if vim.fn.line("$", buf.bufnr) > 1 then
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
    error = "",
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
    pencil = '',
        git = {
            removed = '',
            changed = '',
            added = '',
   }
}
