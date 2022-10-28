require 'boole'.setup({
  mappings = {
    increment = '<C-a>',
    decrement = '<C-x>'
  },
  -- User defined loops
  additions = {
    {'private', 'public', 'protected'},
    {'String', 'List<String>'},
    {'Integer', 'List<Integer>'}
  },

})
