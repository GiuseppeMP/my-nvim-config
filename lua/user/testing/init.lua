local g = vim.g
local n = utils.keymap.n

g.ultest_use_pty = 1

g['test#strategy'] = {
   nearest = 'floaterm',
   file =    'floaterm',
   suite =   'neovim',
}


-- vim.api.nvim_create_autocmd("Filetype", {
--       pattern = "java",
--       callback = function() n('<leader>ta', vim.cmd.TestSuite)end
-- })
