-- coc-extensions keymaps
require "user.plugins.keymaps.coc-explorer"

-- Utils for keymaps
local kutils = require "user.keymaps._utils"
local i_expr_nrk = kutils.i_expr_nrk
local i_expr = kutils.i_expr
-- local n_expr = kutils.n_expr
-- local v_expr = kutils.v_expr
local i = kutils.i
-- local n = kutils.n
-- local x = kutils.x
-- local o = kutils.o

-- -- Auto complete function
-- function _G.check_back_space()
--     local col = vim.fn.col('.') - 1
--     return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
-- Usando TAB para trigar o autocomplete e navegar entre as sugestoes
-- i_expr_nrk("<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()')
-- i_expr_nrk("<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]])

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
-- Faz com que o Enter seleciona o item sugerido pelo complete.
i_expr_nrk("<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]])

-- Use <c-j> to trigger snippets
-- Usando <c-j> para mostrar somente snippets nas sugestoes de autocomplete
i("<c-j>", "<Plug>(coc-snippets-expand-jump)")

-- Use <c-space> to trigger completion.
-- Usando <c-space> para triggar auto complete
i_expr("<c-space>", "coc#refresh()")

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
-- Navegar entre os diagnosticos usando [g ]g
-- n( "[g", "<Plug>(coc-diagnostic-prev)")
-- n( "]g", "<Plug>(coc-diagnostic-next)")

-- GoTo code navigation.
-- n( "gd", "<Plug>(coc-definition)")
-- n( "gy", "<Plug>(coc-type-definition)")
-- n( "gi", "<Plug>(coc-implementation)")
-- n( "gr", "<Plug>(coc-references)")
-- "ga", alternates between test/implementation file ( see projectionist plugin)
-- "ga", alterna entre teste e codigo, mas isso foi configurado em outro plugin (projectionist)

-- Use K to show documentation in preview window.
-- Usando shift+k (K) para visualizar documentação
-- function _G.show_docs()
--     local cw = vim.fn.expand('<cword>')
--     if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
--         vim.api.nvim_command('h ' .. cw)
--     elseif vim.api.nvim_eval('coc#rpc#ready()') then
--         vim.fn.CocActionAsync('doHover')
--     else
--         vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
--     end
-- end

-- n( "K", '<CMD>lua _G.show_docs()<CR>')

-- Symbol renaming.
-- Renomear vars, etc
-- n("<leader>rn", "<Plug>(coc-rename)")

-- Formatting selected code.
-- Formatar codigo, linha, ou selecao
-- x( "<leader>f", "<Plug>(coc-format-selected)")
-- n( "<leader>f", "<Plug>(coc-format-selected)")

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
-- Executar code action no codigo selecionado
-- x( "<leader>a", "<Plug>(coc-codeaction-selected)")
-- n( "<leader>a", "<Plug>(coc-codeaction-selected)")

-- Remap keys for applying codeAction to the current buffer.
-- Executa code actions para o buffer atual
-- n( "<leader>ac", "<Plug>(coc-codeaction)")

-- Apply AutoFix to problem on the current line.
-- Executa comando de quick fix para linha atual
-- n( "<leader>qf", "<Plug>(coc-fix-current)")


-- Run the Code Lens action on the current line.
-- Execute code lens na linha atual
-- n( "<leader>cl", "<Plug>(coc-codelens-action)")

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
-- Mapea as seguintes expressoes como objetos de texto, usados em motions
-- e.g { dif } stands for delete inner function
-- e.g { dif } deleta o conteudo da function
-- x( "if", "<Plug>(coc-funcobj-i)")
-- x( "af", "<Plug>(coc-funcobj-a)")
-- x( "ic", "<Plug>(coc-classobj-i)")
-- x( "ac", "<Plug>(coc-classobj-a)")
-- o( "if", "<Plug>(coc-funcobj-i)")
-- o( "af", "<Plug>(coc-funcobj-a)")
-- o( "ic", "<Plug>(coc-classobj-i)")
-- o( "ac", "<Plug>(coc-classobj-a)")


-- Remap <C-f> and <C-b> for scroll float windows/popups.
---@diagnostic disable-next-line: redefined-local
-- Habilita o scroll u/d em janelas flutuantes
-- n_expr("<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"')
-- n_expr("<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"')
-- i_expr("<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"')
-- i_expr( "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"')
-- v_expr("<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"')
-- v_expr("<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"')

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
-- Seleciona uma regiao do buffer
-- n("<C-s>", "<Plug>(coc-range-select)")
-- x("<C-s>", "<Plug>(coc-range-select)")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
--
-- Show all diagnostics.
-- Mostra todos os problemas diagnistics
-- n( "<space>a", ":<C-u>CocList diagnostics<cr>")


-- Show commands.
-- Mostra todos os comandos possíveis para o buffer
-- n( "<space>c", ":<C-u>CocList commands<cr>")

-- Find symbol of current document.
-- Lista os simbolos do buffer atual
-- n( "<space>o", ":<C-u>CocList outline<cr>")

-- Search workspace symbols.
-- Lista os simbolos do workspace atual
-- n( "<space>s", ":<C-u>CocList -I symbols<cr>")

-- Do default action for next item.
-- Executa acao padrao para o prox item (diagnostico)
-- n( "<space>j", ":<C-u>CocNext<cr>")

-- Do default action for previous item.
-- Executa acao padrao para o item anterior (diagnostico)
-- n( "<space>k", ":<C-u>CocPrev<cr>")

-- Resume latest coc list.
-- Retorna para lista de diagnostics
-- n( "<space>p", ":<C-u>CocListResume<cr>")
