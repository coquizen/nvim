" Settings {{{
let g:airline#extensions#quickfix#location_text = 'Location'
" Define the loclist label
let g:airline#extensions#quickfix#quickfix_text =  'Quickfix'
" Define the quickfix label
let g:airline#extensions#tabline#enabled = 1      " Enable enhanced tabline
let g:airline_powerline_fonts = 1                 " Use powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
" }}}
" Functions {{{
" }}}
" Keymappings {{{
" }}}
" Autocmds {{{
" }}}
