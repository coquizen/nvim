" Settings {{{
" }}}
let g:gruvbox_material_background='hard'
" Functions {{{
function s:initGruvbox() abort
	highlight! CocCodeLens guifg=#606060 ctermfg=60
	highlight! link SignColumn LineNr
	highlight! Visual guifg=NONE guibg=#484848 guisp=NONE gui=NONE ctermfg=NONE ctermbg=242 ctermfg=NONE
	highlight! VisualNOS guifg=NONE guibg=#484848 guisp=NONE gui=reverse ctermfg=NONE ctermbg=242 cterm=NONE
	highlight! IncSearch guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
	highlight! Search guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
endfunction
" }}}
" Keymappings {{{
" }}}
" Autocmds {{{
augroup ThemeGruvboxMaterial
  autocmd!
  autocmd ColorScheme gruvbox-material call s:initGruvbox()
augroup END
" }}}
