" Verifica se o init.vim foi carregado pelo vscode.
" Verify if init.vim was loaded in vscode.
if exists('g:vscode')

" -----------------------------------------------------------------------------
" Custom Keybindings for VSCode Neovim Extensions
" Atalhos customizados para VSCode Neovim Extension
" -----------------------------------------------------------------------------

" Navigate to file explorer like nerdtree
" Navegar para os arquivos igual nerdtree.
nnoremap <Leader>ne <Cmd> call VSCodeNotify('workbench.view.explorer')<CR>

" Rodar os testes do arquivo que está aberto.
" Run the tests of opened file.
nnoremap <Leader>tf <Cmd>call VSCodeNotify('extension.runJest')<CR>
nnoremap <Leader>tf <Cmd>call VSCodeNotify('java.test.editor.run')<CR>

" Roda todos os testes.
" Run all tests.
nnoremap <Leader>ta <Cmd>call VSCodeNotify('testing.runAll')<CR>

" Roda todos os testes em debug.
" Run all tests in debug mode.
nnoremap <Leader>tda <Cmd>call VSCodeNotify('testing.debugAll')<CR>

" Roda o teste que o cursor está focado em debug.
" Run the cursor test in debug mode.
nnoremap <Leader>td <Cmd>call VSCodeNotify('testing.debugAtCursor')<CR>

" Roda o teste que o cursor está focado.
" Run the cursor test.
nnoremap <Leader>tt <Cmd>call VSCodeNotify('testing.runAtCursor')<CR>

" toggle breakpoints na linha.
" toggle breakpoint at cursor.
nnoremap <Leader>tb <Cmd>call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>

" comando de ir adiante de debug.
" debug stepover command.
nnoremap <Leader>dn <Cmd>call VSCodeNotify('workbench.action.debug.stepOver')<CR>

" comando de continuar até o próximo breakpoint.
" debug continue command.
nnoremap <Leader>dc <Cmd>call VSCodeNotify('workbench.action.debug.continue')<CR>

" comando de reiniciar o último comando debug.
" debug restart command.
nnoremap <Leader>dr <Cmd>call VSCodeNotify('workbench.action.debug.restart')<CR>

" ação de rename no cursor do vscode.
" rename action at cursor position in vscode.
nnoremap <Leader>rn <Cmd>call VSCodeNotify('editor.action.rename')<CR>

" mostrar opções de ação no código do cursor.
" show source actions at cursor.
nnoremap <Leader>sa <Cmd>call VSCodeNotify('editor.action.sourceAction')<CR>

" mostrar opções de refatoração no cursor.
" show refactor options at cursor.
nnoremap <Leader>rr <Cmd>call VSCodeNotify('editor.action.refactor')<CR>

" comenta uma linha, utilizando mesmo binding do vim/commentary.
" comment line using vim/commentary keybind.
nnoremap gcc <Cmd>call VSCodeNotify('editor.action.commentLine')<CR>

" comenta toda seleção, utilizando mesmo binding do vim/commentary.
" comment entire selection using vim/comentary keybind.
xmap gc <Cmd>call VSCodeNotifyVisual('editor.action.commentLine', 1)<CR>

" mostra menu de quick fix utilizando mesmo bind do VIM, z=
" Necessário instalar: https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim#keyboard-quickfix
" show quickfix options using VIM default binding z=
" Install needed: https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim#keyboard-quickfix
nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>

" mostra codigo de definição do que está no cursor, em janela lateral.
" show definition code at side of cursor.
nnoremap <C-w>gd <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>

" navega para o codigo de implementação do que está no cursor.
" go to implementation of the cursor code.
nnoremap <Leader>gd <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>

" navega para o teste da implementação do cursor.
" go to test of the code at the cursor.
nnoremap <Leader>gt <Cmd>call VSCodeNotify('java.test.goToTest')<CR>

" Procura arquivos no projeto igual nerdtree ?.
" Find in files using ? like Nerdtree.
nnoremap ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

" Run application command at cursor.
nnoremap <Leader>r <Cmd>call VSCodeNotify('spring-boot-dashboard.localapp.run-multiple')<CR>

endif
