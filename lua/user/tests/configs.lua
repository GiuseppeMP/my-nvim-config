local g = vim.g

g['test#harpoon_term'] = 1

g['test#strategy'] = {
   nearest = 'asyncrun_background',
   file =    'floaterm',
   suite =   'floaterm',
   ['nearest-debug'] =   'asyncrun_background'
}

g.ultest_use_pty = 1


