" settings
																									" Running :Lint will run golint
set rtp+=expand('$GOPATH/src/golang.org/x/lint/misc/vim')
let g:go_def_mapping_enabled = 0                  " Disable default :GoDef shortcut (gd). This will be handled by coc.vim
let g:go_list_type = "quickfix"                   " Force vim-go to use only one type of error-list.
let g:go_term_enabled = 1                         " This option is Neovim only. Use it
                                                  " to change the behavior of the test
                                                  " commands. If set to 1 it opens the
                                                  " test commands inside a new terminal
                                                  " according to |'g:go_term_mode'|,
                                                  " otherwise it will run them in the
                                                  " background just like `:GoBuild`.
let g:go_auto_type_info = 1                       " Automatically display type of the variable under cursor on the status line
let g:go_addtags_transform = 'camelcase'          " Use camelcase as default when linting.
let g:go_highlight_build_constraints = 1          " ┐
let g:go_highlight_extra_types = 1                " │
let g:go_highlight_fields = 1                     " │
let g:go_highlight_functions = 1                  " │ Apply highlights semantically.
let g:go_highlight_methods = 1                    " │
let g:go_highlight_operators = 1                  " │
let g:go_highlight_structs = 1                    " │
let g:go_highlight_types = 1                      " ┘
" Functions
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go'
    call go#cmd#Build(0)
  endif
endfunction
" Keymappings
" Autocmds
" Define a shortcut for :GoBuild or :GoTest using the above function.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files)<CR>

" Define how tabs are shown.
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shifwidth=4
