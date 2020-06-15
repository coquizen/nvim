set backspace=indent                               " ┐ Allow 'backspace'
set backspace+=eol                                 " │ in insert mode over
set backspace+=start                               " ┘ everything.
set showcmd                                        " Show the command being typed.
set cmdheight=2                                    " Set the command section height to two lines;
" useful when there are multiple error messages
"set inccommand=nosplit                            " Neovim highlight
"set colorcolumn=80                                " Set a vertical line at the 80th column.
" let &colorcolumn="80,".join(range(120,999),",")    " Set margins at 80 and 120 columns
" hi ColorColumn ctermbg=235 guibg=#2c2d27
set cursorline                                     " Highlight the current line
hi CursorLine cterm=bold gui=bold
hi Comment cterm=italic gui=italic
set hidden                                         " Allow buffer to become hidden when abandoned.
set laststatus=2                                   " Always show the status line
set lazyredraw                                     " Do not redraw the screen while
" executing macros, registers
" and other commands that have
" not been typed.
set textwidth=80                                   " The standard setting for most text files
set list                                           " Display invisible characters as follows:
set listchars=tab:▸\                               " ┐
set listchars+=trail:·                             " │ Use custom symbols to
" set listchars+=eol:↴                             " │ represent invisible characters.
set listchars+=nbsp:_                              " ┘
set nojoinspaces                                   " When using the join command
" only insert a single space
" after a `.`, `?`, or `!`.
set modeline                                       " Allow for per-file specific settings
set number                                         " Show line number
set numberwidth=4                                  " Increase the minimal number
" columns used for the `line
" number`.
set report=0                                       " Display the count of lines yanked
" or deleted
"set relativenumber                                " Use relative line numbers.
" Current line is still in
" status bar. (Disabled for more dynamic
" use of this setting. See below)
set ruler                                          " Show cursor position
set noshowmode                                     " Don't show the current mode
" (airline.vim will handle
" this)
"set nostartofline                                 " Keep the cursor on the
" on the same column when navigating
" between Lines.
set scrolloff=5                                    " When scrolling, keep the
" cursor 5 lines below the
" top and 5 lines above the
" bottom of the screen.
set guioptions-=R                                  " No left scroll bar
set guioptions-=L                                  " No left scroll bar
set showmatch                                      " Highlight matching brackets
set spelllang=en_us                                " Set the spell-check language.
set splitbelow                                     " ┐ More intuitive window placement
set splitright                                     " ┘ when opening a buffer.
set synmaxcol=2500                                 " Limit syntax highlighting
" (this avoids the very slow
" redrawing when files contain
" long lines).
set title                                          " Show the filename in the
" window title bar.
set wildmenu                                       " Enable enhanced command-line
" completion (by hitting <TAB>
" in command mode, Vim will
" show the possible matches
" just above the command
" line with the first match
" highlighted.
"set winminheight=0                                " Allow windows to be squashed;
set wrap                                           " Enable Linewrapping
if strftime('%H') < 17
	set background=light
	colorscheme gruvbox-material
	let g:airline_theme='gruvbox_material'
else
	set background=dark
	colorscheme ayu
	let g:airline_theme='ayu_dark'
endif
