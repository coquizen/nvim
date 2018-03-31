" ---------------------------------------------------------------------
" | Plugin - neovimhaskell/haskell-vim                                  |
" ----------------------------------------------------------------------
" Align 'then' two spaces after 'if'
let g:haskell_indent_if = 2
" Indent 'where' block two spaces under previous body
let g:haskell_indent_before_where = 2
" Allow a second case indent style (see haskell-vim README)
let g:haskell_indent_case_alternative = 1
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0


" ----------------------------------------------------------------------
" | Plugin - hindent & stylish-haskell                                  |
" ----------------------------------------------------------------------
" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

" RE|MAPPINGS
augroup haskellStylish
  au!
  " Just hindent
  au FileType haskell nnoremap <leader>hi :Hindent<CR>
  " Just stylish-haskell
  au FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
  " First hindent, then stylish-haskell
  au FileType haskell nnoremap <leader>hf :call HaskellFormat('both')<CR>
augroup END

" ----------------------------------------------------------------------
" | Plugin - scooloose/nerdtree                                         |
" ----------------------------------------------------------------------
let NERDTreeMinimalUI = 0
" Since we already have a list of files we'd like to ignore with
" wildignore, have NERDTree respect it.
let NERDTreeRespectWildIgnore = 1

" Open NERDTree automatically when a directory is supplied at nvim execution
augroup nerd_tree
    autocmd!
    autocmd vimrc StdinReadPre * let s:std_in=1
    " If nvim is started with an input directory, start up NERDTree
    autocmd vimrc VimEnter *
                \ if argc() == 1 && isdirectory(argv(0)) |
                \   bd |
                \   exec 'cd' fnameescape(argv(0)) |
                \   NERDTree |
                \ end
augroup end
" Shortcut to toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
" ----------------------------------------------------------------------
" | Plugin - scooloose/nerdcommenter                                    |
" ----------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ----------------------------------------------------------------------
" " | Plugin - vim-airline/vim-airline                                   |
" ----------------------------------------------------------------------
let g:airline_powerline_fonts = 1

" I don't care about the file type, encoding, or format.
let g:airline_section = "%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}"

" ----------------------------------------------------------------------
" | Plugin - autozimu/LanguageClient-neovim                            |
" ----------------------------------------------------------------------
let g:LanguageClient_serverCommands = {
            \ 'haskell': ['hie', '--lsp'],
            \ }
let g:LanguageClient_autoStart = 1

" ----------------------------------------------------------------------
" | Plugin - ghc-mod                                                    |
" ----------------------------------------------------------------------
au FileType haskell
            \ map <silent> <buffer> tc :GhcModTypeClear<CR> |
            \ map <silent> <buffer> ti :GhcModTypeInsert<CR> |
            \ map <silent> <buffer> tt :GhcModType<CR> |
augroup xmonad
		autocmd!
		autocmd BufRead,BufNewFile ~/.xmonad/* call s:add_xmonad_path()
function! s:add_xmonad_path()
		let lib_path = resolve(expand('~/.xmonad/lib'))
		let base_dir = resolve(expand('~/.xmonad'))
    " For ghcmod-vim plugin
    if !exists('b:ghcmod_ghc_options')
        let b:ghcmod_ghc_options = []
        let g:ghcmod_use_basedir = []
    endif
    call add(b:ghcmod_ghc_options, '-i' . expand('~/.xmonad/lib'))
    call add(g:ghcmod_use_basedir, base_dir)
endfunction
augroup end
"     " For neomake
"     " let cur = neomake#makers#ft#haskell#ghcmod()
"     " let cur.args = ['-g', '-i' . lib_path, 'check']
"     " let b:neomake_haskell_ghcmod_maker = cur
" " endfunction
" ----------------------------------------------------------------------
" | Plugin - ervandew/supertab                                           |
" ----------------------------------------------------------------------
function! EnableSuperTab()
		let g:SuperTabDeefautCompletionType = '<c-x><c-o>'
		let g:haskellmode_completion_ghc = 0
		let g:necoghc_enable_detailed_browse = 1
		setlocal omnifunc=necoghc#omnifunc

		if has("gui_running")
				imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
		else
				if has("unix")
						inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
				endif
		endif
endfunction

" autocmd FileType haskell :call EnableSuperTab()

" ----------------------------------------------------------------------
" | Plugin - emajutsushi/tagbar                                          |
" ----------------------------------------------------------------------
" Open Tagbar for the following languages
autocmd FileType haskell nested :TagbarOpen
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
" ----------------------------------------------------------------------
" | Plugin - vim-syntastic/syntastic                                    |
" ----------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ----------------------------------------------------------------------
" | Plugin - Shougo/deoplete.vim                                    |
" ----------------------------------------------------------------------
set completeopt=longest,menuone " auto complete setting
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns = {}
" For GOLANG
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1

" ----------------------------------------------------------------------
" | Plugin - neomake/neomake                                            |
" ----------------------------------------------------------------------
autocmd BufWritePost * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }
" ----------------------------------------------------------------------
" | Plugin - faith/vim-go                                               |
" ----------------------------------------------------------------------
let g:go_def_mapping_enabled = 1
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1

" ----------------------------------------------------------------------
" | Plugin - scrooloose/nerdtree                                        |
" ----------------------------------------------------------------------
" Open NERDTree if nvim opens on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Don't quit NERDtree when opening a file
let NERDTreeQuitOnOpen = 0
" Automatically close NERDTree if last man standing
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Pretty NERDTree UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" ----------------------------------------------------------------------
" | Plugin - vim-airline/vim-airline                                    |
" ----------------------------------------------------------------------
" Displau Buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" ----------------------------------------------------------------------
" | Plugin - ryanoasis/vim-devicons                                    |
" ----------------------------------------------------------------------
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" ----------------------------------------------------------------------
" | Plugin - rakr/vim-one                                              |
" ----------------------------------------------------------------------
" Enables italics if using the one colorscheme
let g:one_allow_italics = 1


" ----------------------------------------------------------------------
" | GUI Settings                                                         |
" ----------------------------------------------------------------------
if (has("termguicolors"))
	set termguicolors
endif
colorscheme one
set background=dark
" ----------------------------------------------------------------------
" | Plugin - neovim/neovim-ghcmod                                       |
" ----------------------------------------------------------------------
" map <leader>u to toggle the undoo truee
map <leader>u :UndotreeToggle<cr>

