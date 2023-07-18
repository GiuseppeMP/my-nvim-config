local g = vim.g

g.ultest_use_pty = 1

g['test#strategy'] = {
   nearest = 'neovim',
   file =    'neovim',
   suite =   'neovim',
}
