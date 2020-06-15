" This function will open a file in the current buffer if it is empty
" otherwise will open in a split pane.
function! OpenInSplitIfBufferDirty(file)
  if line('$') ==# 1 && getline(1) ==# ''
    exec 'e' a:file
  else
    exec 'sp' a:file
  endif
endfunction

command! -nargs=1 -complete=file -bar CleverOpen
            \ :call OpenInSplitIfBufferDirty(<q-args>)


