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
Plug 'scrooloose/nerdcommenter'                   " A collection of comment functions
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'    " Extra syntax and highlight for nerdtree files
Plug 'majutsushi/tagbar'                          " Displays tags on the right side of the screen and lets you navigate through them.
Plug 'airblade/vim-rooter'                        " Changes Vim working directory to project root (identified by presence of known directory or file).
Plug 'junegunn/vim-easy-align'                    " A vim alignment plugin
Plug 'ervandew/supertab'                          " Tab completion that integrates with neco-ghc-lushtags to let you do language-aware tab completion.
Plug 'simnalamburt/vim-mundo'                     " Vim undo tree visualizer
"Plug 'tommcdo/vim-lion'                           " A simple alignment operator for Vim text editor
Plug 'sjl/vitality.vim'                           " Integrate vim nicely with tmux and iterm2
"Plug 'Shougo/denite.nvim'                         " Dark powered asynchronous unite all interfaces for Neovim
Plug 'jremmen/vim-ripgrep'                        " Rapid string search through files
"Plug 'metakirby5/codi.vim'                        " Interactive scratchpad
"Plug 'tpope/vim-projectionist'                    " projectionist.vim: project configuration
"Plug 'tpope/vim-dispatch'                         " Asynchronous build and test dispatcher
"Plug 'radenling/vim-dispatch-neovim'              " Adds neovim support to vim-dispatch
Plug 'chrisbra/Colorizer'                         " color hex codes and color names
"Plug 'janko-m/vim-test'                           " Run your tests at the speed of thought
"Plug 'Shougo/neosnippet.vim'                      " neo-snippet plugin
"Plug 'honza/vim-snippets'                        " vim-snipmate default snippets (Previously snipmate-snippets)
"Plug 'Chiel92/vim-autoformat'                     " Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'sbdchd/neoformat'                           " A (Neo)vim plugin for formatting code.

" Terminal interaction
Plug 'benmills/vimux'                             " vim plugin to interact with tmux
"Plug 'christoomey/vim-tmux-navigator'
Plug 'zenbro/mirror.vim'                  " Simultaneously work on two files at once
"Plug 'vim-jp/vital.vim'
"Plug 'haya14busa/vital-string-interpolation'

" Git
Plug 'airblade/vim-gitgutter'                     " Display git diff in margin
"Plug 'junegunn/gv.vim'                            " Git commit browser
Plug 'tpope/vim-fugitive'                         " a Git wrapper so awesome, it should be illegal

" Colorschemes
Plug 'rakr/vim-one'                               " 24bit
Plug 'morhetz/gruvbox'                            " 24bit
Plug 'lifepillar/vim-solarized8'                  " 24bit
Plug 'icymind/NeoSolarized'                       " 24bit
Plug 'flazz/vim-colorschemes'                     " Various colorschemes
Plug 'jacoborus/tender'                           " Another colorscheme
Plug 'KnoP-01/tortus'                             " Dark gray (yellow on black) colorshecme based on torte.
Plug 'zanglg/nova.vim'                            " 24bit colorscheme
Plug 'tomasr/molokai'                             " Molokai theme

" Backengines
Plug 'autozimu/LanguageClient-neovim',            " Language Client Server for handling dictionaries
            \ { 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ 'for': [ 'Haskell' ]
            \ }
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}        " Interactive command execution in Vim.
Plug 'neomake/neomake'                            " Asynchronous linting and make framework for Neovim/Vim
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugin'}
					                                   " Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/neco-syntax'                         " Syntax source for neocomplete/deoplete/ncm
"Plug 'sheerun/vim-polyglot'                       " A solid language pack for Vim.
"Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'vim-syntastic/syntastic'                    " Syntax Checking Hacks
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'

" Language Specific Plugins

"  SQL
Plug 'joereynolds/SQHell.vim'                     " An SQL wrapper for vim
"   VIMRC
Plug 'Shougo/neco-vim'                            " Dictionary for vimrc for Completion

" Markdown
Plug 'suan/vim-instant-markdown'                  " live view of markdown in browser

"   HASKELL
Plug 'centromere/vim-haskellConcealPlus'          " Display ligatures without modifying
Plug 'bitc/lushtags'                              " Create ctags compatible tags files for Haskell
                                                  " underlying source code.
"   GO
Plug 'fatih/vim-go',                              " Go development plugin for Vim
            \ { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go',                         " Asynchronous Go completion for Neovim. deoplete source for Go.
            \ { 'do': 'make' }
"Plug 'jodosha/vim-godebug'                        " On MacOS, 'brew install delve' first

"   ELM
Plug 'Elmcast/elm-vim'                            " Elm settings

"   HTML/JS/CSS
Plug 'othree/javascript-libraries-syntax.vim',    " Syntax for JavaScript libraries
       \ { 'for':
       \ ['javascript', 'javascript.jsx'] }
Plug 'othree/html5.vim'                           " HTML5 omnicomplete and syntax
Plug 'tpope/vim-surround'                         " Wrap current words in tags, quotes, etc..
Plug 'ap/vim-css-color'                           " Preview colors in css

"   ZSH
Plug 'chrisbra/vim-zsh'                           " Syntax highlighting for zshrc files

"   RUBY
Plug 'vim-ruby/vim-ruby'                          " Syntax and Tools for Ruby
Plug 'tpope/vim-rails'									  " rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-endwise'                          " wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'joker1007/vim-ruby-heredoc-syntax'			  " vim plugin for highliting code in ruby here document

"Plug 'fishbullet/deoplete-ruby',                  " Deoplete sources for ruby language
            "\ { 'for': 'ruby' }
"Plug 'skalnik/vim-vroom'                          " A vim plugin for running your Ruby tests

" Status Line
Plug 'vim-airline/vim-airline'                    " Status line alternative
Plug 'vim-airline/vim-airline-themes'             " Color themes for airline
Plug 'ryanoasis/vim-devicons'                     " Adds file type glyphs/icons to populr vim plugins}: NERDTree, Airline Powerline Unite, etcc...

call plug#end()
" }}}

"   Settings {{{
" ------------------------------------
" benmills/vimux
let g:VimuxHeight = "10"

" simnalamburt/vim-mundo
let g:mundo_close_on_revert = 1                   " Set to 1 to automatically close the Mundo windows when revertin

" vim-ruby?vim-ruby
let g:ruby_indent_block_style = 'do'
let g:ruby_spellcheck_strings = 1

" airblade/vim-root
let g:rooter_patterns = [ '.learn' ]

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
autocmd FileType haskell nested :TagbarOpen       " Configure tagbar for hasktags
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

" fatih/vim-go
let g:go_fmt_command = "goimports"                " duto import packages when file is saved
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
let g:LanguageClient_serverCommands = { 'haskell': ['hie', '--lsp'], }
                                                  " Configure LSP to use haskell-ide-engine
" vim-airline/vim-airline
let g:airline#extensions#quickfix#location_text = 'Location'
                                                  " Define the loclist label
let g:airline#extensions#quickfix#quickfix_text =  'Quickfix'
                                                  " Define the quickfix label
let g:airline#extensions#tabline#enabled = 1      " Enable enhanced tabline
let g:airline_powerline_fonts = 1                 " Use powerline symbols

" ryanoasis/vim-devicons
let g:webdevicons_enable= 1                       " enable the plugin
let g:webdevicons_enable_nerdtree = 1             " adding the flags to NERDTree
let g:webdevicons_enable_airline_tabline = 1      " adding to vim-airline's tabline
let g:webdevicons_enable_airline_statusline = 1   " adding to vim-airline's statusline

" Shougo/deoplete.vim {{{
set completeopt=longest,menuone                   " auto complete setting
if has('nvim')
   let g:deoplete#enable_at_startup = 1          " enable deoplete at startup
endif
let g:deoplete#enable_smart_case = 1              " When a capital letter is
                                                  " included in input, deoplete does
                                                  " not ignore the upper- and lowercase.
let g:deoplete#file#enable_buffer_path = 1        " Autocomplete files relative to current buffer
let g:deoplete#max_list = 30                      " Show maximum of 30 entries in autocomplete popup
let g:deoplete#enable_camel_case = 1              " Enable camel case completion
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns = {}
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const'] " For GOLANG
let g:deoplete#sources#go#align_class = 1

" neomake/neomake
autocmd BufWritePost * Neomake
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
" }}}

" ---------------------------------------------------------------
" |
" | General {{{
" |
" ---------------------------------------------------------------

" System Settings
" ------------------------------------
set nocompatible                                   " Don't make nvim vi-compatible
set clipboard=unnamed                              " Setting to integrate with mac os clipboard
set mouse=a                                        " Enable mouse over all modesa
set shell=bash\ -i                                 " for the live markdown plugin
" Colors and Fonts
" ------------------------------------
if (has("termguicolors"))                          " ┐ Attempt to set
    set termguicolors                              " │ 24 bit colors,
    colorscheme one                                " │ and enable a 24 bit colorscheme
else                                               " │ otherwise, set a sane scheme
    colorscheme molokai                            " │
endif                                              " ┘
set background=dark                                " Set the overall interface dark

" User Interface
" ------------------------------------
set backspace=indent                               " ┐ Allow 'backspace'
set backspace+=eol                                 " │ in insert mode over
set backspace+=start                               " ┘ everything.
set showcmd                                        " Show the command being typed.
set cmdheight=2                                    " Set the command section height to two lines;
                                                   " useful when there are multiple error messages
"set inccommand=nosplit                             " Neovim highlight
" set colorcolumn=80                               " Set a vertical line at the 80th column.
let &colorcolumn="80,".join(range(120,999),",")    " Set margins at 80 and 120 columns
hi ColorColumn ctermbg=235 guibg=#2c2d27
set cursorline                                     " Highlight the current line
hi CursorLine cterm=bold gui=bold
hi Comment cterm=italic gui=italic
"set cpoptions+=$                                  " When making a change, don't
                                                   " redisplay the line, and
                                                   " instead, put a `$` sign at
                                                   " the end of the changed text.
set laststatus=2                                   " Always show the status line
set lazyredraw                                     " Do not redraw the screen while
                                                   " executing macros, registers
                                                   " and other commands that have
                                                   " not been typed.
set textwidth=80                                   " The standard setting for most text files
set list                                           " Display invisible characters as follows:
set listchars=tab:▸\                               " ┐
set listchars+=trail:·                             " │ Use custom symbols to
"set listchars+=eol:↴                              " │ represent invisible characters.
set listchars+=nbsp:_                              " ┘
set nojoinspaces                                   " When using the join command
                                                   " only insert a single space
                                                   " after a `.`, `?`, or `!`.
set modeline                                       " Allow for per-file specific settings
set number                                         " Show line number
set numberwidth=5                                  " Increase the minimal number
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
set guioptions-=L                                  " No left scrool bar
set showmatch                                      " Highlight matching brackets
set spelllang=en_us                                " Set the spell-check language.
set splitbelow                                     " ┐ More intuitive window placement
set splitright                                     " ┘
set synmaxcol=2500                                 " Limit syntax highlighting
                                                   " (this avoids the very slow
                                                   " redrawing when files contain
                                                   " long lines).
set title                                          " Show the filename in the
                                                   " window title bar.
"set virtualedit=all                               " Allow cursor to be anywhere.
set wildmenu                                       " Enable enhanced command-line
                                                   " completion (by hitting <TAB>
                                                   " in command mode, Vim will
                                                   " show the possible matches
                                                   " just above the command
                                                   " line with the first match
                                                   " highlighted.
"set winminheight=0                                " Allow windows to be squashed;
set wrap                                           " Enable Linewrapping

"  Text, Tab, and Indent Related
" ------------------------------------
filetype plugin indent on                          " set the tab settings according to filetyoe
set tabstop=3                                      " ┐ Tab characters to appear 3 spaces wide
set smarttab                                       " │ Enable the tab key to go to next tabstop
set softtabstop=2                                  " │ Make the tab key insert comb. of spcs
set shiftwidth=4                                   " │ and tabs to simulate tab stops s
                                                   " │ Size of the 'indent'
set expandtab                                      " ┘ Use spaces instead of tab
set showtabline=2                                  " Always show tab bar.

" Seach and Replace
" ------------------------------------
set gdefault                                       " Default add g flag to
                                                   " search/replace. Add `g` to
                                                   " toggle.
set hlsearch                                       " Highlight all search matches
hi Search cterm=bold gui=bold
set ignorecase                                     " Ignore case in search patterns.
set incsearch                                      " Highlight search pattern as
                                                   " it is being typed.
set magic                                          " Enable extended regexp.
set smartcase                                      " Override `ignorecase` option
                                                   " if the search pattern
                                                   " contains uppercase
                                                   " characters.

" File Settings
" ------------------------------------
set encoding=utf-8                                 " Use UTF-8 without BOM
set fileencoding=utf-8
set binary                                         " Enables reading of binary
set wildignore+=*.jpeg                             " ┐
set wildignore+=*.gif                              " │
set wildignore+=*.png                              " │
set wildignore+=*.gif                              " │
set wildignore+=*.psd                              " │
set wildignore+=*.o                                " │Ignore these filetypes
set wildignore+=*.obj                              " │
set wildignore+=*.min.js                           " │
set wildignore+=*/bower_c*/*                       " │
set wildignore+=*/node_m*/*                        " │
set wildignore+=*/vendor/*                         " │
set wildignore+=*/.git/*                           " │
set wildignore+=*/.hg/*                            " │
set wildignore+=*/.svn/*                           " │
set wildignore+=*/log/*                            " │
set wildignore+=*.hi                               " │
set wildignore+=xmonad.state                       " │
set wildignore+=xmonad.errors                      " │
set wildignore+=prompt-history                     " │
set wildignore+=*/tmp/*                            " ┘

" Backups, Undo's, Swaps Oh My!
" ------------------------------------
if !strlen($SUDO_USER)                             " For system security, test to see
                                                   " if nvim was invoked by sudo. Sensitive
                                                   " files should not leave traces around
                                                   " in user's directory.
  set backup                                       " Keep the backup file of current file
                                                   " before recent save.
  if !isdirectory($HOME . "/.local/share/nvim/backup")
      call mkdir($HOME . "/.local/share/nvim/backup", "p")
  endif

  set backupdir=~/.local/share/nvim/backup//       " The double slash at the end
                                                   " of the directory prods Vim into keeping
                                                   " full path to the file in its undo filename
                                                   " to avoid collisions. This is used
                                                   " to same effect for undo files. (See below)
  set undofile                                     " enable undo file but in a different directory
  if !isdirectory($HOME . '/.local/share/nvim/undo')
    call mkdir($HOME . '/.local/share/nvim/undo', 'p', 0700)
  endif
  set undodir^=~/.local/share/nvim/undo//          " Location of the undo history

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
augroup rubyft
    autocmd!
    autocmd FileType ruby setlocal smartindent expandtab ts=2 sw=2 sts=2 completeopt=menu,preview
   autocmd FileType ruby let b:dispatch = 'learn --fast-fail'
   autocmd BufEnter *.rb highlight rubyPseudoVariable cterm=italic gui=italic ctermfg=red guifg=red
augroup END

" This function will open a file in the current buffer if it is empty
" otherwise will open in a split pane.
function! OpenInSplitIfBufferDirty(file)
  if line('$') == 1 && getline(1) == ''
    exec 'e' a:file
  else
    exec 'sp' a:file
  endif
endfunction
" Re|Mappings
" ------------------------------------
" Define <leader> as ','
let mapleader="\<space>"

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" <leader>t will call :Dispatch
nnoremap <leader>t :Dispatch<CR>

" Remap the ':' with ';' for faster access to cmdline mode
noremap ; :

" Reading and Writing Protected Files
cmap w!! w !sudo tee > /dev/null %

" [\* ] Search and replace the word under the cursor.
map <leader>* :%s/\<<C-r><C-w>\>//<Left>

" [\xs] Clear search terms.
map <leader>xs <Esc>:noh<CR>

" [\l] will run the the learn testing tool in vimux
"
map <leader>lr :call VimuxRunCommand("unbuffer learn --fail-fast \| less -m -X -g -G -i -J --underline-special -p Failure")<CR>
map <leader>li :call VimuxInspectRunner()<CR>
map <leader>lq :call VimuxCloseRunner()<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
" Insert a newline without going into insert mode
"
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" <Tab> to switch to next buffer, <Shift><Tab> to the previous one
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>

" Window navigation using <C-[h,j,k,l]>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

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

" Use the language server functionality
noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
