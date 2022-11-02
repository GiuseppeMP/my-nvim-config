local k = require 'user.keymaps._utils'

local n = k.n
local i = k.i
local o = k.o
local x = k.x
local i_expr = k.i_expr

local function rp_term_cmd(cmd)
    vim.cmd(vim.api.nvim_replace_termcodes(cmd, true, true ,true))
end

local function fzfOpenLF(cmd)
    local b_name = vim.fn.expand('%')
    local is_forb_buffer = b_name:find('coc-explorer', 0, true) or b_name:find('NERD_tree', 0, true)
    local _winnr = vim.fn.winnr('$') > 1
    if is_forb_buffer and _winnr then
        rp_term_cmd("normal! <c-w><c-w>")
    end
    rp_term_cmd("normal! " .. cmd .. "<cr>")
end

n("<C-p>", function() fzfOpenLF(':Files') end)
n("<C-p><C-p>", function() fzfOpenLF(':GFiles') end)

n("<C-p><C-f>", function() fzfOpenLF(':Ag') end)

n("<Leader><Enter>", function() fzfOpenLF(':Buffers') end)
n("<Leader>l", function() fzfOpenLF(':Lines') end)

-- Insert mode completion
i( '<c-x><c-k>', '<plug>(fzf-complete-word)')
i( '<c-x><c-f>', '<plug>(fzf-complete-path)')
i( '<c-x><c-l>', '<plug>(fzf-complete-line)')


-- Mapping selecting mappings
n( '<leader><leader><tab>', '<plug>(fzf-maps-n)')
x( '<leader><leader><tab>', '<plug>(fzf-maps-x)')
o( '<leader><leader><tab>', '<plug>(fzf-maps-o)')



i_expr( '<c-x><c-f>', "fzf#vim#complete#path('fd')")
i_expr( '<c-x><c-f>', "fzf#vim#complete#path('rg --files')")

-- Word completion with custom spec with popup layout option
i_expr( '<c-x><c-k>', "fzf#vim#complete#word({'window': { 'width': -5.2, 'height': 0.9, 'xoffset': 1 }})")
