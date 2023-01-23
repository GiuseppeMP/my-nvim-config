local modicator = require('modicator')

modicator.setup({
  -- NOTE: Modicator requires line_numbers and cursorline to be enabled
  line_numbers = true,
  cursorline = true,
  -- highlights = {
  --   modes = {
  --     ['i'] = modicator.get_highlight_fg('Question'),
  --     ['v'] = modicator.get_highlight_fg('Type'),
  --     ['V'] = modicator.get_highlight_fg('Type'),
  --     ['�'] = modicator.get_highlight_fg('Type'),
  --     ['s'] = modicator.get_highlight_fg('Keyword'),
  --     ['S'] = modicator.get_highlight_fg('Keyword'),
  --     ['R'] = modicator.get_highlight_fg('Title'),
  --     ['c'] = modicator.get_highlight_fg('Constant'),
  --   },
  -- },
})
