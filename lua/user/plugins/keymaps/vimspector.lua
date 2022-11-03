local n = require 'user.keymaps._utils'.n
local x = require 'user.keymaps._utils'.x

-- " mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

-- " for normal mode - the word under the cursor
n( '<Leader>de', '<Plug>VimspectorBalloonEval')

-- " for visual mode, the visually selected text
x( '<Leader>de', '<Plug>VimspectorBalloonEval')

n( '<Leader>bb', '<Plug>VimspectorToggleBreakpoint')

-- " Debug continue
n( '<Leader>dc', '<Plug>VimspectorContinue')

n( '<Leader>do', '<Plug>VimspectorStepOver')

n( '<Leader>di', '<Plug>VimspectorStepInto')

n( '<Leader>dx', '<Plug>VimspectorStepOut')

-- " Open breakpoint windows
n( '<Leader>db', '<Plug>VimspectorBreakpoints')

-- " Restart debug session with the same configuration
n( '<Leader>dr', '<Plug>VimspectorRestart')

-- " Restart debug session with the same configuration
n( '<Leader>dr', ':call vimspector#Reset()<CR>')

-- " Start debug java attach
n( '<Leader>dd', ':CocCommand java.debug.vimspector.start<CR>')

