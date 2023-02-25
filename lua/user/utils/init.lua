-- lua global utils
_G.utils = {}

-- https://github.com/rxi/lume
_G.lume = require'user.utils.lume'

-- pretty print
_G.utils.pprint = require'user.utils.pprint'.pprint

-- print as json
_G.utils.print_as_json = require'user.utils.print_as_json'

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

