let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'


function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

" nnoremap <silent> <C-g>g :call FZFOpen(':Ag')<CR>
" nnoremap <silent> <C-g>c :call FZFOpen(':Commands')<CR>
" nnoremap <silent> <C-g>l :call FZFOpen(':BLines')<CR>
" nnoremap <silent> <C-p> :call FZFOpen(':Files')<CR>


set rtp+=/usr/local/opt/fzf
" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" " Launch fzf with CTRL+P.
" nnoremap <silent> <C-p> :FZF -m<CR>
nnoremap <silent> <C-p><C-p> :call FZFOpen(':Files')<CR>
nnoremap <silent> <C-p> :call FZFOpen(':GFiles')<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :call FZFOpen(':Buffers')<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Mapping selecting mappings
nmap <leader><leader><tab> <plug>(fzf-maps-n)
xmap <leader><leader><tab> <plug>(fzf-maps-x)
omap <leader><leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
