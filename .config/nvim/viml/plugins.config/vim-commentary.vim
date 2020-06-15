" Settings
" Define the commenting style for react files.
let s:patternTable = {
      \ 'jsxRegion': '{/* %s */}'
      \}
let s:temp = ''

" Functions
" Assist function to detect commenting region.
function s:detectRegion() abort
  let l:selectPattern = ''
  let l:stack = synstack(line('.'), col('.'))
  if !empty(l:stack)
    for l:name in map(stack, 'synIDattr(v:val, "name")')
      if has_key(s:patternTable, l:name)
        let l:selectPattern = s:patternTable[l:name]
      endif
    endfor
  endif
  if l:selectPattern !=# ''
    if &l:commentstring !=# l:selectPattern
      if s:temp ==# ''
        let s:temp = &l:commentstring
      endif
      let &l:commentstring = l:selectPattern
    endif
  else
    if s:temp !=# ''
      let &l:commentstring = s:temp
    endif
  endif
  Commentary
endfunction
" Scanning function
function s:scan() abort
  let l:stack = synstack(line('.'), col('.'))
  for l:name in l:stack
    echo synIDattr(l:name, 'name')
  endfor
endfunction
" Keymappings
" Trigger detectRegion and toggle commenting.
noremap <leader>cc :call <SID>detectRegion()<CR>
noremap <leader>v :call <SID>scan()<CR>

" Autocmds
