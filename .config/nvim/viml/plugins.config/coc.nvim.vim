"Settings {{{
"" Use the following extensions
let g:coc_global_extensions = [
			\ 'coc-emoji',
			\ 'coc-tsserver',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-json',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-stylelint',
			\ 'coc-vimlsp',
			\ 'coc-spell-checker',
			\ 'coc-svelte',
			\ 'coc-webpack',
			\ 'coc-cspell-dicts',
			\ 'coc-highlight',
			\ 'coc-yank',
			\ 'coc-tabnine',
			\ 'coc-pairs',
			\ 'coc-yaml',
			\ 'https://github.com/xabikos/vscode-react',
			\ 'https://github.com/xabikos/vscode-javascript',
			\]

" Set the node path since NVM is being used.
if exists('$NVM_BIN')
	let g:coc_node_path = '/home/caninodev/.config/nvm/current/bin/node'
endif

if exists('+pumheight')
	set pumheight=30
endif
" }}}
"Functions {{{
" Used in the keymapping below to trigger auto-completion engine.
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction
" }}}
"Keymapping {{{
" Use <tab> to trigger completion and navigate to the next complete item.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h> "

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}
"Autocmd {{{
augroup coc_au
	autocmd!
	" Show function signature while editing
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

	" Highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')
	" Highlight text color
	autocmd ColorScheme * highlight! CocHighlightText guibg=#054c20 ctermbg=023
augroup END
" }}}
