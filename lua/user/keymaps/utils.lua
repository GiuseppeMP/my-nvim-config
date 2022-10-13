local function k(mode, key, map)
   local opts = { noremap = true, silent = true }
   vim.api.nvim_set_keymap(mode,key, map, opts)
end

local function kexpr(mode, key, func)
   local opts_exp = { noremap = true, silent = false, expr=true }
   vim.api.nvim_set_keymap(mode, key, func, opts_exp)
end

-- Modes
--     n: normal only
--     v: visual and select
--     o: operator-pending
--     x: visual only
--     s: select only
--     i: insert
--     c: command-line
--     l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

local function n(key, map)
   k("n",key, map)
end

local function ne(key, func)
    kexpr("n", key, func)
end

local function i(key, map)
   k("i",key, map)
end

local function v(key, map)
   k("v",key, map)
end

local function x(key, map)
   k("x",key, map)
end


return { ne = ne, n = n, i = i, v = v }
