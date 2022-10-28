local g = vim.g

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
