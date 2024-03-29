-- Keymap utils for diferent Modes and opts
--     n: normal only
--     v: visual and select
--     o: operator-pending
--     x: visual only
--     s: select only
--     i: insert
--     c: command-line
--     l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

-- default opts
local opts = { noremap = true, silent = true }
-- expr opts
local opts_expr = vim.tbl_extend('force', opts, { remap = false, expr = true })
-- expr opts with no replace keycodes
local opts_expr_no_replace_keycodes = vim.tbl_extend('force', opts_expr, { replace_keycodes = false })


---keymap with @opts
---@param mode string
---@param key string
---@param map string|function
-- @param desc[opt] string
local function _k(mode, key, map, desc)
    local k_opts = opts
    if not utils.is_empty(desc) then
        k_opts.desc = desc
    end
    vim.keymap.set(mode, key, map, k_opts)
end

---keymap with @opts_expr
---@param mode string i, n, x, v
---@param key string keymap used.
---@param func string expression mapped.
local function _k_expr(mode, key, func)
    vim.keymap.set(mode, key, func, opts_expr)
end

-- keymap with @opts_expr_no_replace_keycodes
---@param mode string i, n, x, v
---@param key string keymap used.
---@param func string expression mapped.
local function _k_expr_nr(mode, key, func)
    vim.keymap.set(mode, key, func, opts_expr_no_replace_keycodes)
end

---terminal mode
---@param key string
---@param map string|function
-- @param desc[opt] string
local function t(key, map, desc)
    _k("t", key, map, desc)
end

---normal mode, noremap, silent
---@param key string
---@param map string|function
-- @param desc[opt] string
local function n(key, map, desc)
    _k("n", key, map, desc)
end

---normal mode, noremap, silent, expr, no replace keycode
---@param key string
---@param expr string
local function n_expr_nrk(key, expr)
    _k_expr_nr("n", key, expr)
end

---insert mode, noremap, silent, expr, no replace keycode
---@param key string
---@param expr string
local function i_expr_nrk(key, expr)
    _k_expr_nr("i", key, expr)
end

---normal mode, noremap, silent, expr
---@param key string
---@param expr string
local function n_expr(key, expr)
    _k_expr("n", key, expr)
end

---insert mode, noremap, silent, expr
---@param key string
---@param expr string
local function i_expr(key, expr)
    _k_expr("i", key, expr)
end

---insert mode, noremap, silent
---@param key string
---@param map string
local function i(key, map)
    _k("i", key, map)
end

---visual and select mode, noremap, silent
---@param key string
---@param map string
local function v(key, map)
    _k("v", key, map)
end

---visual and select mode, noremap, silent, expr
---@param key string
---@param expr string
local function v_expr(key, expr)
    _k_expr("v", key, expr)
end

---visual only mode, noremap, silent
---@param key string
---@param map string
local function x(key, map)
    _k("x", key, map)
end

---operation pending, noremap, silent
---@param key string
---@param map string
local function o(key, map)
    _k("o", key, map)
end

local function write_buffer()
    if vim.fn.getbufinfo('%')[1].changed == 1 then
        vim.cmd("write")
    end
end

return {
    n_expr_nrk = n_expr_nrk,
    i_expr_nrk = i_expr_nrk,
    n_expr = n_expr,
    i_expr = i_expr,
    v_expr = v_expr,
    write_buffer = write_buffer,
    n = n,
    i = i,
    v = v,
    x = x,
    o = o,
    t = t,
}
