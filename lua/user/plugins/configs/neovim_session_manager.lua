local Path = require('plenary.path')
local session_manager = require 'session_manager'

session_manager.setup({
    sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),             -- The directory where the session files will be saved.
    path_replacer = '__',                                                    -- The character to which the path separator will be replaced for session files.
    colon_replacer = '++',                                                   -- The character to which the colon symbol will be replaced for session files.
    autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    autosave_last_session = true,                                            -- Automatically save last session on exit and on session switch.
    autosave_ignore_not_normal = true,                                       -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    autosave_ignore_dirs = {},                                               -- A list of directories where the session will not be autosaved.
    autosave_ignore_filetypes = {                                            -- All buffers of these file types will be closed before the session is saved.
        'gitcommit',
    },
    autosave_ignore_buftypes = {},    -- All buffers of these bufer types will be closed before the session is saved.
    autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
    max_path_length = 80,             -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})


local config_group = vim.api.nvim_create_augroup('session_manager_group', {}) -- A global group for all your config autocommands

---Launch alpha if vim starts with only empty buffers
--
local has_non_empty_buffers = function()
  for _, buf in ipairs(vim.fn.getbufinfo({listed=true})) do
    -- skip unloaded and hidden buffers
    if buf.loaded and not buf.hidden then
      -- check if buffer is non-empty
      if vim.fn.line("$", buf.bufnr) > 1 then
        return true
      end
    end
  end
  return false
end

vim.api.create_autocmd('VimEnter', {
  group = config_group,
  pattern = '*',
  callback = function()
    local is_buffer_active = has_non_empty_buffers()
    local session_name = require 'session_manager.utils'.get_current_session_name()
    if (not is_buffer_active) and (not session_name) then
      vim.cmd [[ :Alpha ]]
    end
  end
})


vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionLoadPost",
  group = config_group,
  callback = function()
    require('nvim-tree').toggle(false, true)
  end,
})
