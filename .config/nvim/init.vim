" Author: Ian G Canino
"
" Description: an opinionated configuration for neovim based on my usaage
" for Haskell, Swift, and general fullstack development on MacOS. Despite the
" massive list of plugins in this configuration, I highly I recommend reading
" 'Practical Vim: Edit Text at the Speed of Thought'
"
" Plugin Manager: I use junegunn's 'Minimalist Vim Plugin Manager'
"    https://github.com/junegunn/vim-plug
"
" Settings: Most of the settings were inspired by:
"     Tim Pope -- https://github.com/tpope/vim-sensible (General)
"     Amir Salihefendic -- https://github.com/amix/vimrc (General)
"     ccorbi -- https://github.com/ccorbi/lightdotfiles
"     John Mendonça -- https://github.com/johnmendonca/nvim (Haskell)
"
"     HASKELL
"       https://wiki.haskell.org/Vim
"       https://github.com/haskell/haskell-ide-engine
"
"     GOLANG
"       https://medium.com/@ambot/neovim-and-go-8f32e6390f71
"
"     ELM
"       https://github.com/ElmCast/.vim
"
"     RUBY
"       https://github.com/gacha/nvim-config
"
" Sections:
"   Plugins:
"     Plugin Initialization
"     Plugins
"       General
"       Git
"       Colorschemes
"       BackEngines
"       Languages Status Line
"     Settings
"
"  General:
"     System Settings
"     Colors and Fonts
"     User Interface
"     Text, Tab, and Indent Related
"     Visual Mode Related
"     Navigation
"     Status Line
"     Spell Checking
"     Misc
"     Helper Functions

" ---------------------------------------------------------------
" |
" | Plugins {{{
" |
" ---------------------------------------------------------------
"
"     Plugin Initialization
" ------------------------------------
"
" Install junegunn's plugin manager if not already installed.
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"     Plugins
" ------------------------------------

call plug#begin('~/.local/share/nvim/plugged')    " Specify a directory for plugins

" General
Plug 'mhinz/vim-startify'                         " A nice startup page
Plug 'scrooloose/nerdtree'                        " A tool to navigate directory tree
Plug 'simnalamburt/vim-mundo'                     " Vim undo tree visualizer
Plug 'jremmen/vim-ripgrep'                        " Rapid string search through files
Plug 'chrisbra/Colorizer'                         " color hex codes and color names
Plug 'wakatime/vim-wakatime'							        " Vim plugin for automatic
                                                  " time tracking and metrics
																									" generated from your
																									" programming activity.

" Terminal interaction
"Plug 'benmills/vimux'                             " vim plugin to interact with tmux
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'zenbro/mirror.vim'                           " Simultaneously work on two files at once
"Plug 'vim-jp/vital.vim'
"Plug 'haya14busa/vital-string-interpolation'

" Git
Plug 'airblade/vim-gitgutter'                     " Display git diff in margin

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'                 " Papercolor theme
Plug 'rakr/vim-one'                               " 24bit
Plug 'morhetz/gruvbox'                            " 24bit
Plug 'lifepillar/vim-solarized8'                  " 24bit
Plug 'icymind/NeoSolarized'                       " 24bit
Plug 'flazz/vim-colorschemes'                     " Various colorschemes
Plug 'jacoborus/tender'                           " Another colorscheme
Plug 'KnoP-01/tortus'                             " Dark gray (yellow on black) colorshecme based on torte.
Plug 'zanglg/nova.vim'                            " 24bit colorscheme
Plug 'tomasr/molokai'                             " Molokai theme
Plug 'protesilaos/tempus-themes-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'nanotech/jellybeans.vim'

" UI
Plug 'machakann/vim-highlightedyank'              " Make the yanked region apparent
Plug 'ervandew/supertab'                          " Perform all your vim insert
                                                  " mode completions with Tab
" Editor Plugins
Plug 'tpope/vim-surround'                         " Wrap current words in tags, quotes, etc..

Plug 'tyru/caw.vim'                               " Vim comment plugin

" Status Line
Plug 'vim-airline/vim-airline'                    " Status line alternative
Plug 'vim-airline/vim-airline-themes'             " Color themes for airline
Plug 'ryanoasis/vim-devicons'                     " Adds file type glyphs/icons
                                                  " to popular vim plugins:
                                                  " NERDTree, Airline
                                                  " Powerline Unite, etc...
Plug 'junegunn/fzf',
			\ { 'dir': '~/.config/fzf', 'do': './install --all' }

" Code Analysis & Linting
Plug 'prabirshrestha/async.vim'                   " Normalize async job control API
Plug 'prabirshrestha/asyncomplete.vim'            " Async-completion in pure vimscript
Plug 'prabirshrestha/asyncomplete-lsp.vim'        " Provide LSP autocompletion source
Plug 'prabirshrestha/vim-lsp'                     " Async LSP plugin
Plug 'mattn/vim-lsp-settings'                     " Auto LSP configurations for vim-lsp
Plug 'Shougo/context_filetype.vim'                " Context filetype detetcion for nested code

" Misc
Plug 'prabirshrestha/asyncomplete-buffer.vim'     " Provides buffer autocomplete
Plug 'prabirshrestha/asyncomplete-tags.vim'       " Provides tag autocomplete
Plug 'prabirshrestha/asyncomplete-file.vim'       " Provides file autocomplete

" Language Specific Plugins
"

"  SQL
Plug 'joereynolds/SQHell.vim'                     " An SQL wrapper for vim

"  VIMRC
Plug 'prabirshrestha/asyncomplete-necovim.vim'    " Provides syntax autocomplete via neco-vim
Plug 'Shougo/neco-vim'                            " Dictionary for vimrc for Completion
Plug 'vim-jp/syntax-vim-ex'                       " Improved syntax for VimScript

" Markdown
"Plug 'suan/vim-instant-markdown'                  " live view of markdown in browser

"  HASKELL
"Plug 'centromere/vim-haskellConcealPlus'          " Display ligatures without modifying
"Plug 'bitc/lushtags'                              " Create ctags compatible tags files for Haskell
" underlying source code.
"
"  GO
Plug 'fatih/vim-go',                              " Go development plugin for Vim
			\ { 'do': ':GoInstallBinaries' }

"   HTML/JS/CSS
Plug 'hail2u/vim-css3-syntax'                     " CSS3 syntax support to Vim's
                                                  " built-in syntax/css.vim

Plug 'othree/csscomplete.vim'                     " Updated built-in CSS complete
                                                  " with the latest standards

Plug 'cakebaker/scss-syntax.vim'                  " Syntax file for scss
Plug 'othree/html5.vim'                           " HTML5 omnicomplete and syntax
Plug 'pangloss/vim-javascript'                    " Enhanced javascript syntax
Plug 'maxmellon/vim-jsx-pretty'                   " React JSX syntax pretty
                                                  " highlighting

" GraphQL
Plug 'jparise/vim-graphql'                        " GraphQL file detection,
                                                  " syntax highlighting, and
                                                  " indentation

" Node
Plug 'moll/vim-node'                              " Superb development with
                                                  " NodeJS

" Tmux.conf
Plug 'tmux-plugins/vim-tmux'                      " Plugin for tmux.conf

" Generic log files support
Plug 'MTDL9/vim-log-highlighting'                 " Syntax highlighting for
                                                  " generic log files

"  ZSH
Plug 'chrisbra/vim-zsh'                           " Syntax highlighting for
                                                  " zshrc files

call plug#end()
" }}}

"   Settings {{{
" ------------------------------------

" prabirshrestha/asyncomplete.vim
let g:asyncomplete_auto_completeopt = 0

" prabirshresta/vim-lsp
let g:lsp_auto_enable = argc() > 0
let g:lsp_ignorecase = 1
let g:lsp_signs_enabled = 1
let g:lsp_async_completion = 1
let g:lsp_fold_enabled = 0
let g:lsp_text_edit_enabled = 1
let g:lsp_peek_alignment = 'top'
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 400
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_highlights_delay = 400
let g:lsp_diagnostics_signs_error = {'text': '✖'}
let g:lsp_diagnostics_signs_warning = {'text': '⬪'}
let g:lsp_diagnostics_signs_hint = {'text': '▪'}
let g:lsp_diagnostics_signs_information = {'text': '▫'}

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete

	if exists('+tagfunc')
		setlocal tagfunc(lsp#tagfunc)
	endif

	nmap <silent><buffer> K <Plug>(lsp-hover)
	nmap <silent><buffer> gr <Plug>(lsp-seek-implmentation)
	nmap <silent><buffer> gi <Plug>(lsp-peek-type-definition)
	nmap <silent><buffer> gd <Plug>(lsp-peek-declaration)
	nmap <silent><buffer> rn <Plug>(lsp-rename)
	nmap <silent><buffer> gA <Plug>(lsp-code-action)
	nmap <silent><buffer> ,s <Plug>(lsp-signature-help)
	nmap <silent><buffer> [d <Plug>(lsp-previous-diagnostic)
	nmap <buffer><Leader> F  <Plug>(lsp-document-format)
endfunction

autocmd User lsp_float_opened
			\ nmap <buffer> <silent> <Esc> <Plug>(lsp-preview-close)
autocmd User lsp_float_closed silent! nunmap <buffer> <Esc>
autocmd! FileType markdown.lsp-hover
			\ nmap <silent><buffer>q :pclose<CR>| doautocmd <nomodeline> BufWinEnter
autocmd! User lsp_buffer_enabled call <SID>on_lsp_buffer_enabled()

" mattn/vim-lsp-settings
let g:lsp_settings = {
			\ 'yaml-language-server': {
			\		'allowlist': ['yaml','yaml.ansible'],
			\ }
			\}
augroup enable_lsp
	autocmd BufReadPre,VimEnter * if ! g:lsp_auto_enable | call lsp#enable() | endif
augroup END

" prabirshrestha/asyncomplete-necovim.vim
augroup enable_for_vimscript
	autocmd User asyncomplete_setup call asyncomplete#register_source(
				\ asyncomplete#sources#necovim#get_source_options({
				\ 'name': 'necovim',
				\ 'allowlist': ['vim'],
				\ 'completor': function('asyncomplete#sources#necovim#completor'),
				\ }))
augroup END

" prabirshrestha/asyncomplete-buffer.vim
autocmd User asyncomplete_setup call asyncomplete#register_source(
			\ asyncomplete#sources#buffer#get_source_options({
			\ 'name': 'buffer',
			\ 'allowlist': ['*'],
			\ 'blocklist': ['go', 'denite', 'denite-filter', 'clap_input',
			\               'quickpick-filter', 'lsp-quickpick-filter'],
			\ 'completor': function('asyncomplete#sources#buffer#completor'),
			\ 'config': {
			\    'max_buffer_size': 4000000,
			\  },
			\ }))

" prabirshrestha/asyncomplete-tags.vim
autocmd User asyncomplete_setup call asyncomplete#register_source(
			\ asyncomplete#sources#tags#get_source_options({
			\ 'name': 'tags',
			\ 'allowlist': ['*'],
			\ 'blocklist': ['go', 'python', 'vim', 'denite', 'denite-filter',
			\               'clap_input', 'quickpick-filter', 'lsp-quickpick-filter'],
			\ 'completor': function('asyncomplete#sources#tags#completor'),
			\ 'config': { 'max_file_size': 5000000 },
			\ }))

" prabirshrestha/asyncomplete-file.vim
autocmd User asyncomplete_setup call asyncomplete#register_source(
			\ asyncomplete#sources#file#get_source_options({
			\ 'name': 'file',
			\ 'priority': 10,
			\ 'allowlist': ['*'],
			\ 'blocklist': ['denite', 'denite-filter', 'clap_input',
			\               'quickpick-filter', 'lsp-quickpick-filter'],
			\ 'completor': function('asyncomplete#sources#file#completor')
			\ }))
"

" benmills/vimux
let g:VimuxHeight = "10"

" jacoborus/tender
"let g:airline_theme = "tender"
" simnalamburt/vim-mundo
let g:mundo_close_on_revert = 1                   " Set to 1 to automatically close the Mundo windows when revertin

" vim-ruby/vim-ruby
let g:ruby_indent_block_style = 'do'
let g:ruby_spellcheck_strings = 1

" nanotech/jellybean.vim
let g:jellybeans_use_term_italics = 1

" airblade/vim-root
"let g:rooter_patterns = [ '.learn' ]

" drewtempelmeyer/palenight.vim
"let g:airline_theme = "palenight"

" kyoz/purify
let g:airline_theme = "purify"

" tpope/vim-projectionist
"let g:projectionist_heuristics = {
			"\ 'app/**/*.rb': {
			"\   'app/**/*.rb': {
			"\     'alternate': 'test/{}_spec.rb'
			"\   },
			"\   'test/**/*_spec.rb': {
			"\     'alternate': 'lib/{}.rb',
			"\     'dispatch': 'rspec'
			"\   }
			"\   },
			"\ '*.rb': {
			"\   '*.rb': {
			"\     'alternate': 'test/{}_spec.rb'
			"\   },
			"\   'test/*_spec.rb': {
			"\     'alternate': '{}.rb',
			"\     'dispatch': 'rspec'
			"\   }
			"\ }
"\}
" See below for extending this for use with Flatiron's learning labs

" maxmellon/vim-jsx-react
let g:vim_jsx_pretty_colorful_config=1





" Detect when inside Flatiron's learning lab

" junegunn/vim-easy-align Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" janko-m/vim-test
"let test#strategy = "dispatch"
"let test#ruby#bundle_exec = 0
"
" vim-syntastic/syntasticq

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Setup for javascript
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" scrooloose/nerdtree
autocmd StdinReadPre * let s:std_in=1             " Open NERDTree if nvim opens on a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NERDTreeIgnore=['.DS_Store']
let NERDTreeRespectWildIgnore = 1                 " Refer to wildignore for additional files
let NERDTreeHighlightCursorLine = 1               " Highlight the selected entry in the tree
let NERDTreeQuitOnOpen = 0                        " Don't quit NERDtree when opening a file
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Close vim if the only window left open is a NERDTree<Paste>
let NERDTreeMinimalUI = 1                         " Pretty NERDTree UI
let NERDTreeDirArrows = 1

" scrooloose/nerdtreecommenter
let g:NERDCompactSexyComs = 1                     " Use compact syntax for prettified multi-line comments

" emajutsushi/tagbar
"autocmd FileType haskell nested :TagbarOpen       " Configure tagbar for hasktags
"let g:tagbar_type_haskell = {
"    \ 'ctagsbin'  : 'hasktags',
"    \ 'ctagsargs' : '-x -c -o-',
"    \ 'kinds'     : [
"        \  'm:modules:0:1',
"        \  'd:data: 0:1',
"        \  'd_gadt: data gadt:0:1',
"        \  't:type names:0:1',
"        \  'nt:new types:0:1',
"        \  'c:classes:0:1',
"        \  'cons:constructors:1:1',
"        \  'c_gadt:constructor gadt:1:1',
"        \  'c_a:constructor accessors:1:1',
"        \  'ft:function types:1:1',
"        \  'fi:function implementations:0:1',
"        \  'o:others:0:1'
"    \ ],
"    \ 'sro'        : '.',
"    \ 'kind2scope' : {
"        \ 'm' : 'module',
"        \ 'c' : 'class',
"        \ 'd' : 'data',
"        \ 't' : 'type'
"    \ },
"    \ 'scope2kind' : {
"        \ 'module' : 'm',
"        \ 'class'  : 'c',
"        \ 'data'   : 'd',
"        \ 'type'   : 't'
"    \ }
			"\ }
"
" fatih/vim-go
"let g:go_fmt_command = "goimports"                " duto import packages when file is saved
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_term_enabled = 1                         " This option is Neovim only. Use it
" to change the behavior of the test
" commands. If set to 1 it opens the
" test commands inside a new terminal
" according to |'g:go_term_mode'|,
" otherwise it will run them in the
" background just like `:GoBuild`.
let g:go_list_type = "quickfix"                   " An issue with `vim-go` and `syntastic`
" is that the location list window
" that contains the output of commands
" such as `:GoBuild` and `:GoTest` might
" not appear.
let g:go_addtags_transform = "camelcase"          " By default 'snakecase' is used.
" Possible values are: ["snakecase", camelcase"].
let g:go_auto_sameids = 1                         " This option will highlight all uses of
" the identifier under the cursor (:GoSameIds) automatically.
let g:go_auto_type_info = 1                       " Automatically display type of the variable under cursor on the status line

" autozimu/LanguageClient-neovim
let g:LanguageClient_serverCommands = { 'go': ['gopls'], }
" vim-airline/vim-airline
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
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='papercolor'								  " set the theme



" ryanoasis/vim-devicons
let g:webdevicons_enable= 1                       " enable the plugin
let g:webdevicons_enable_nerdtree = 1             " adding the flags to NERDTree
let g:webdevicons_enable_airline_tabline = 1      " adding to vim-airline's tabline
let g:webdevicons_enable_airline_statusline = 1   " adding to vim-airline's statusline

" Junegunn/fzf
let $FZF_DEFAULT_COMMAND =  "rg --files --hidden 2>/dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Shougo/deoplete.vim {{{
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview
set completeopt=longest,menuone                   " auto complete setting
if has('nvim')
	let g:deoplete#enable_at_startup = 1          " enable deoplete at startup
endif
let g:deoplete#enable_camel_case = 1              " Enable camel case completion
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const'] " For GOLANG
let g:deoplete#sources#go#align_class = 1

" neomake/neomake
"autocmd BufWritePost * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
" Customize the labels for
" neomake
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
" For GOLANG
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
" Customize the labels for
" neomake
" }}}

" ---------------------------------------------------------------
" |
" | General {{{
" |
" ---------------------------------------------------------------

" System Settings
" ------------------------------------
set nocompatible                                   " Don't make nvim vi-compatible
set clipboard=unnamedplus                          " Setting to integrate with mac os
" clipboard.
set mouse=a                                        " Enable mouse over all modes
"set shell=bash/ -i                                  " for the live markdown plugin
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim    " Running :Lint will run golint
set hidden                                         " Allow abandoning an
" unsaved buffer when opening
" another one.
if has('mac')
	let g:clipboard = {
				\ 'name': 'macOS-clipboard',
				\ 'copy': {
				\		'+': 'pbcopy',
				\		'*': 'pbcopy',
				\ },
				\ 'paste': {
				\		'+': 'pbpaste',
				\		'*': 'pbpaste',
				\ },
				\ 'cache_enabled': 0,
				\ }
endif
if has('clipboard')
	set clipboard& clipboard^=unnamed,unnamedplus
endif

" Colors and Fonts
" ------------------------------------
if (has("termguicolors"))                         " ┐ Attempt to set
	set termguicolors                               " │ 24 bit colors,
	colorscheme purify                              " │ and enable a 24 bit colorscheme
else                                              " │ otherwise, set a sane scheme
	colorscheme molokai                             " │
endif                                             " ┘

set background=dark                               " Set the overall interface dark

" User Interface
" ------------------------------------
set backspace=indent                              " ┐ Allow 'backspace'
set backspace+=eol                                " │ in insert mode over
set backspace+=start                              " ┘ everything.

set showcmd                                       " Show the command being typed.

set cmdheight=2                                   " Set the command section height to two lines;
                                                  " useful when there are multiple error messages

"set inccommand=nosplit                           " Neovim highlight
"
" set colorcolumn=80                              " Set a vertical line at the 80th column.
"
let &colorcolumn="80,".join(range(120,999),",")   " Set margins at 80 and 120 columns
hi ColorColumn ctermbg=235 guibg=#2c2d27

set cursorline                                    " Highlight the current line
hi CursorLine cterm=bold gui=bold
hi Comment cterm=italic gui=italic

"set cpoptions+=$                                 " When making a change, don't
                                                  " redisplay the line, and
                                                  " instead, put a `$` sign at
                                                  " the end of the changed text.

set laststatus=2                                  " Always show the status line

set lazyredraw                                    " Do not redraw the screen while
                                                  " executing macros, registers
                                                  " and other commands that have
                                                  " not been typed.

set textwidth=80                                  " The standard setting for most text files

set list                                          " Display invisible characters as follows:

set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,nbsp:␣

"set listchars=tab:▸\                             " ┐
"set listchars+=trail:·                           " │ Use custom symbols to
""set listchars+=eol:↴                            " │ represent invisible characters.
"set listchars+=nbsp:_                            " ┘

set nojoinspaces                                  " When using the join command
                                                  " only insert a single space
                                                  " after a `.`, `?`, or `!`.

set modeline                                      " Allow for per-file specific settings

set number                                        " Show line number

set numberwidth=5                                 " Increase the minimal number
                                                  " columns used for the `line
                                                  " number`.

set report=1                                      " Display the count of lines yanked
                                                  " or deleted

"set relativenumber                               " Use relative line numbers.
                                                  " Current line is still in
                                                  " status bar. (Disabled for more dynamic
                                                  " use of this setting. See below)

set ruler                                         " Show cursor position

set noshowmode                                    " Don't show the current mode
                                                  " (airline.vim will handle
                                                  " this)

"set nostartofline                                " Keep the cursor on the
                                                  " on the same column when navigating
                                                  " between Lines.

set scrolloff=5                                   " When scrolling, keep the
                                                  " cursor 5 lines below the
                                                  " top and 5 lines above the
                                                  " bottom of the screen.

set guioptions-=R                                 " No left scroll bar

set guioptions-=L                                 " No left scrool bar

set showmatch                                     " Highlight matching brackets

set spelllang=en_us                               " Set the spell-check language.

set splitbelow                                    " ┐ More intuitive window placement
set splitright                                    " ┘

set synmaxcol=2500                                " Limit syntax highlighting
                                                  " (this avoids the very slow
                                                  " redrawing when files contain
                                                  " long lines).

set title                                         " Show the filename in the
                                                  " window title bar.

"set virtualedit=all                              " Allow cursor to be anywhere.

set wildmenu                                      " Enable enhanced command-line
                                                  " completion (by hitting <TAB>
                                                  " in command mode, Vim will
                                                  " show the possible matches
                                                  " just above the command
                                                  " line with the first match
                                                  " highlighted.
"set winminheight=0                               " Allow windows to be squashed;

set wrap                                          " Enable Linewrapping

set completeopt=menuone                           " Always show menu even with one line

set completeopt+=noselect                         " Do not select a match in the menu

set completeopt+=noinsert                         " Do not insert any text for a match
                                                  " until user select from
                                                  " the menu.

if has('termguicolors') && &termguicolors         " Pseudo transparency for completion
	if exists('&pumblend')                          " menu and floating windows
		set pumblend=10
	endif
	if exists('&winblend')
		set winblend=10
	endif
endif

"  Text, Tab, and Indent Related
" ------------------------------------
filetype plugin indent on                         " set the tab settings according to filetyoe

set tabstop=2                                     " ┐ Tab characters to appear 3 spaces wide
set smarttab                                      " │ Enable the tab key to go to next tabstop
set softtabstop=2                                 " │ Make the tab key insert comb. of spcs
set shiftwidth=4                                  " │ and tabs to simulate tab stops s
                                                  " │ Size of the 'indent'
set shiftwidth=2                                  " │ and tabs to simulate tab stops s
                                                  " │ Size of the 'indent'
set expandtab                                     " ┘ Use spaces instead of tab

set showtabline=2                                 " Always show tab bar.

set foldmethod=indent                             " Set the fold to be determined by indents
set foldlevel=99

" Seach and Replace
" ------------------------------------
set gdefault                                      " Default add g flag to
                                                  " search/replace. Add `g` to
                                                  " toggle.


set hlsearch                                      " Highlight all search matches
hi Search cterm=bold gui=bold

set ignorecase                                    " Ignore case in search patterns.

set incsearch                                     " Highlight search pattern as

                                                  " it is being typed.
set magic                                         " Enable extended regexp.

set smartcase                                     " Override `ignorecase` option
                                                  " if the search pattern
                                                  " contains uppercase
                                                  " characters.

" File Settings
" ------------------------------------
set encoding=utf-8                                " Use UTF-8 without BOM
set fileencoding=utf-8

set binary                                        " Enables reading of binary

set wildignore+=*.jpeg                            " ┐
set wildignore+=*.gif                             " │
set wildignore+=*.png                             " │
set wildignore+=*.gif                             " │
set wildignore+=*.psd                             " │
set wildignore+=*.o                               " │Ignore these filetypes
set wildignore+=*.obj                             " │
set wildignore+=*.min.js                          " │
set wildignore+=*/bower_c*/*                      " │
set wildignore+=*/node_m*/*                       " │
set wildignore+=*/vendor/*                        " │
set wildignore+=*/.git/*                          " │
set wildignore+=*/.hg/*                           " │
set wildignore+=*/.svn/*                          " │
set wildignore+=*/log/*                           " │
set wildignore+=*.hi                              " │
set wildignore+=xmonad.state                      " │
set wildignore+=xmonad.errors                     " │
set wildignore+=prompt-history                    " │
set wildignore+=*/tmp/*                           " ┘

" Backups, Undo's, Swaps Oh My!
" ------------------------------------
if !strlen($SUDO_USER)                            " For system security, test to see
	" if nvim was invoked by sudo. Sensitive
	" files should not leave traces around
	" in user's directory.
	set backup                                      " Keep the backup file of current file

	" before recent save.
	if !isdirectory($HOME . "/.local/share/nvim/backup")
		call mkdir($HOME . "/.local/share/nvim/backup", "p")
	endif

	set backupdir=~/.local/share/nvim/backup//      " The double slash at the end
                                                	" of the directory prods Vim into keeping
                                                	" full path to the file in its undo filename
                                                	" to avoid collisions. This is used
                                                	" to same effect for undo files. (See below)
	set undofile                                    " enable undo file but in a different directory
	if !isdirectory($HOME . '/.local/share/nvim/undo')
		call mkdir($HOME . '/.local/share/nvim/undo', 'p', 0700)
	endif
	set undodir^=~/.local/share/nvim/undo//         " Location of the undo history

	" Have the swap files saved in one place instead of cluttering up the
	" working directory. (NOT recommended if multiple users are editing the same
	" file)
	if !isdirectory($HOME . '/.local/share/nvim/swap')
		call mkdir($HOME . '/.local/share/nvim/swap', 'p', 0700)
	endif

	set directory^=$HOME/.local/share/nvim/swap//
endif

" Macros
" ------------------------------------

" Modify the highlighting of nontext, specialkey and extrawhitespaces
augroup vimrc
	autocmd!
	autocmd vimrc ColorScheme * :hi NonText ctermfg=236
	autocmd vimrc ColorScheme * :hi SpecialKey ctermfg=23
	autocmd vimrc ColorScheme * :hi ExtraWhitespace ctermbg=red guibg=red     " Show trailing whitespace
augroup END

" Automatically set read-only for files being edited elsewhere
augroup check_file_promiscuity
	autocmd!
	autocmd SwapExists * nested let v:swapchoice = 'o'
augroup END

" Check to see file has changed agressively
augroup aggressive_file_check
	autocmd!
	autocmd FocusGained * checktime
	autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endishk
augroup END

augroup goyo
	autocmd! User GoyoEnter LimeLight
	autocmd! User GoyoLeave Limelight!
augroup END
" Return to last cursor position when reoponing a file
augroup preserve_last_cursor_position
	autocmd!
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Automatically reload nvim's configuration files when changes are saved
augroup auto_reload_nvim_configs
	autocmd!
	autocmd BufWritePost init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Dynamic use of relative line number
augroup relative_line_numbering " show absolute numbers in insert mode, otherwise relative line numbers
	autocmd!
	autocmd vimrc InsertEnter * :set norelativenumber
	autocmd vimrc InsertLeave * :set relativenumber
augroup END

" Strip trailing whitespaces except for markdown files (might screw up formatting)
augroup strip_trailing_whitespaces
	let excludedFileTypes = [
				\ "markdown",
				\ "mkd.markdown"
				\ ]
	autocmd!
	" Only strip the trailing whitespaces on save if the file type is not in
	" the aforementioned excludedFileType variable
	autocmd BufWritePre * if index(excludedFileTypes, &ft) < 0 | :%s/\s\+$//e
augroup END

" The following setup will automatically run tests when a test file or its alternate application file is saved:
"augroup test
"autocmd!
"autocmd BufWrite * if test#exists() | TestFile endif
"
"augroup END

" ruby
" augroup rubyft
" 	autocmd!
" 	autocmd FileType ruby setlocal smartindent expandtab ts=2 sw=2 sts=2 completeopt=menu,preview
" 	autocmd FileType ruby let b:dispatch = 'learn --fast-fail'
" 	autocmd BufEnter *.rb highlight rubyPseudoVariable cterm=italic gui=italic ctermfg=red guifg=red
" augroup END

" augroup golang
" 	autocmd!
" 	autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting()
" augroup END

" This function will open a file in the current buffer if it is empty
" otherwise will open in a split pane.
function! OpenInSplitIfBufferDirty(file)
	if line('$') == 1 && getline(1) == ''
		exec 'e' a:file
	else
		exec 'sp' a:file
	endif
endfunction


" This function defines fzf's behavior
"
function! FloatingFZF()
	let buf = nvim_create_buf(v:false, v:true)
	call setbufvar(buf, '&signcolumn', 'no')
	let height = float2nr(min([10, &lines/2]))
	let width = float2nr(min([80, &columns/2]))
	let horizontal = float2nr((&columns - width) / 2)
	let vertical = 1
	let opts = {
				\ 'relative': 'editor',
				\ 'row': vertical,
				\ 'col': horizontal,
				\ 'width': width,
				\ 'height': height,
				\ 'style': 'minimal'
				\ }
	call nvim_open_win(buf, v:true, opts)
endfunction

" For improved search and replace (see below()
function! s:get_selection(cmdtype)
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction


" Re|Mappings
" ------------------------------------
" Define <leader> as '\'
let mapleader="\<space>"

" Start a new line from any position in insert mode
inoremap<S-Return> <C-o>o
" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Drag current line/s vertically and auto-indent
nnoremap <leader>k :m-2<CR>==
nnoremap <leader>j :m+<CR>==
vnoremap <leader>k :m'<-2<CR>gv=gv
vnoremap <leader>j :m'>+<CR>gv=gv

" <C-r> easier search and replace in visual/select mode
xnoremap <C-r> :<C-u>call <SID>get_selection('/')<CR><SID>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>
" <leader>t will call :Dispatch
"nnoremap <leader>t :Dispatch<CR>

" Remap the ':' with ';' for faster access to cmdline mode
"
"noremap ; :

" Reading and Writing Protected Files
cmap w!! w suda://%

" [\* ] Search and replace the word under the cursor.
map <leader>* :%s/\<<C-r><C-w>\>//<Left>

" [\xs] Clear search terms.
map <leader>xs <Esc>:noh<CR>

" [\l] will run the the learn testing tool in vimux
"
"map <leader>lr :call VimuxRunCommand("unbuffer learn --fail-fast \| less -m -X -g -G -i -J --underline-special -p Failure")<CR>
"map <leader>li :call VimuxInspectRunner()<CR>
"map <leader>lq :call VimuxCloseRunner()<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Insert a newline without going into insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" <Tab> to switch to next buffer, <Shift><Tab> to the previous one
nnoremap <C-Tab> :<C-U>tabnext<CR>
nnoremap <C-S-Tab> :<C-U>tabprevious<CR>

" Window navigation using <C-[h,j,k,l]>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Show vim syntax highlight groups for character under cursor
nmap <silent> <Leader>h
			\ :echo 'hi<'.synIDattr(synID(line('.'), col('.'), 1), 'name')
			\ . '> trans<'.synIDattr(synID(line('.'), col('.'), 0), 'name') . '> lo<'
			\ . synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name') . '>'<CR>

" [\v] edit the config files
nnoremap <silent> <leader>vi :tabnew <bar> :e $HOME/.config/nvim/init.vim<CR>

" Use Alt {1,2 ...} to to tab by number
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt
noremap <A-0> :tablast<cr>

" I fat finger quite a bit
if has('user_commands')
	command! -bang -complete=file -nargs=? E e<bang> <args>
	command! -bang -complete=file -nargs=? W w<bang> <args>
	command! -bang -complete=file -nargs=? WQ wq<bang> <args>
	command! -bang -complete=file -nargs=? Wq wq<bang> <args>
	command! -bang Q q<bang>
	command! -bang Qa qa<bang>
	command! -bang QA qa<bang>
	command! -bang Wa wa<bang>
	command! -bang WA wa<bang>
endif

" Trigger fzf
nnoremap <C-Space> :FZF<CR>

" Use the language server functionality
noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

" Open the macOS dictionary on current word
if has('mac')
	nmap <leader>? :!open dict://<cword><CR>
endif
" Remap such that only yanked text get sent to the system clipboard.
nnoremap c "cc
vnoremap c "cc
nnoremap C "cC
vnoremap C "cC

nnoremap d "dd
vnoremap d "dd
nnoremap D "dD
vnoremap D "dD

nnoremap x "xx
vnoremap x "xx
nnoremap X "xX
vnoremap X "xX
