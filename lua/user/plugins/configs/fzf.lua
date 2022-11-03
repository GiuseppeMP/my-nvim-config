local g = vim.g


vim.env.FZF_DEFAULT_OPTS= '--bind ctrl-a:select-all'
vim.opt.rtp:prepend("/usr/local/opt/fzf")

g.fzf_preview_use_dev_icons = 1
g.fzf_preview_dev_icon_prefix_string_length = 5
g.fzf_colors = {
    fg = {'fg', 'Normal'},
    bg=      {'bg', 'Normal'},
    hl=      {'fg', 'Comment'},
    ['fg+'] =     {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
    ['bg+'] =     {'bg', 'CursorLine', 'CursorColumn'},
    ['hl+'] =     {'fg', 'Statement'},
    info=    {'fg', 'PreProc'},
    prompt=  {'fg', 'Conditional'},
    pointer= {'fg', 'Exception'},
    marker=  {'fg', 'Keyword'},
    spinner= {'fg', 'Label'},
    header=  {'fg', 'Comment'}
}

g.fzf_action = {
    [ 'ctrl-t' ] = 'tab split',
    [ 'ctrl-x' ] = 'split',
    [ 'ctrl-v' ] = 'vsplit',
    [ 'ctrl-y' ] = "{lines -> setreg('*', join(lines, '\n'))}"
}

g.fzf_buffers_jump = 1

g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
