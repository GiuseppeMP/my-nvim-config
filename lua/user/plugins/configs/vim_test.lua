local g = vim.g

g.ultest_use_pty = 1

g['test#strategy'] = {
   nearest = 'asyncrun_background',
   file =    'asyncrun_background',
   suite =   'asyncrun_background',
}
