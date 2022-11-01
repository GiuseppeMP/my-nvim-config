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
    if string.find(vim.fn.expand('%'), 'NERD_tree') and vim.fn.winnr('$') > 1 then
        rp_term_cmd("normal! <c-w><c-w>")
    end
    rp_term_cmd("normal! " .. cmd .. "<cr>")
end

n("<C-p>", function() fzfOpenLF(':Files') end)
n("<C-p><C-p>", function() fzfOpenLF(':GFiles') end)

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
