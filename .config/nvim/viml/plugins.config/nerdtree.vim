" Settings {{{
let NERDTreeRespectWildIgnore = 1                 " Refer to wildignore for additional files
let NERDTreeHighlightCursorLine = 1               " Highlight the selected entry in the tree
let NERDTreeQuitOnOpen = 0                        " Don't quit NERDtree when opening a file
let NERDTreeMinimalUI = 1                         " Enable minimal NERDTree UI
let NERDTreeDirArrows = 1                         " Use directory arrows
" }}}
" Functions {{{
" Prevent focus in NERDTree while loading files from fzf.
function! PreventBuffersInNERDTree()
  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
        \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
        \ && &buftype == '' && !exists('g:launching_fzf')
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
    NERDTree
  endif
  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction

" Create New Empty Buffer if NERDTree is the only buffer open.
function! s:CreateNewEmptyBufferIfOnlyNERDTreeLeft()
  if winnr('$') != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    enew | bd# | endif
endfunction
" }}}
" Keymappings {{{
" }}}
" Autocmds {{{
augroup NERDTree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1             " Open NERDTree if nvim opens on a directory
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
  autocmd BufWinEnter * call PreventBuffersInNERDTree()
  autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | bp | bd# | endif
  autocmd BufEnter * call s:CreateNewEmptyBufferIfOnlyNERDTreeLeft()
	autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
augroup END
" }}}
