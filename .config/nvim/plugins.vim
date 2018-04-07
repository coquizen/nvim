" This file will load the plugin manager (if it doesn't exists) then a select
" of plugins.

" ---------------------------------------------------------------
" | Plugins                                                      |
" ---------------------------------------------------------------
"
"    -----------------
"   / Plugin Manager /
"  -----------------

" Check to see if the manager has been installed, if not, then install and run
let vimplug_status = expand(expand("~/.local/share/nvim/site/autoload/plug.vim"))

if !filereadable(vimplug_status)
		if !executable("curl")
				echoerr "You have to install or first install vim-plug yourself!"
				execute "q!"
		endif

		echo "Installing Vim-Plug..." echo ""

		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"    -------------
"   / Plugins     /
"  --------------

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
"
" General
" -------
Plug 'mhinz/vim-startify'                             " A nice startup page

Plug 'scrooloose/nerdtree'                            " A tool to navigate directory tree

Plug 'scrooloose/nerdcommenter'                       " A collection of comment functions

Plug 'majutsushi/tagbar'                              " Displays tags on the right side of the screen and lets you navigate through them.

Plug 'junegunn/vim-easy-align'                        " A vim alignment plugin

Plug 'ervandew/supertab'                              " Tab completion that integrates with neco-ghc-lushtags to let you do language-aware tab completion.

Plug 'mbbill/undotree'																" Undo plugin.


                                                      " Git Plugins
                                                      " ------------
Plug 'airblade/vim-gitgutter'                         " Display git diff in margin
                                                      "
                                                      " Colorschemes
                                                      " -------------
Plug 'rakr/vim-one'                                   " 24bit

Plug 'morhetz/gruvbox'                                " 24bit

Plug 'lifepillar/vim-solarized8'                      " 24bit

Plug 'flazz/vim-colorschemes'                         " Various colorschemes

Plug 'jacoborus/tender'                               " Another colorscheme

Plug 'KnoP-01/tortus'                                 " Dark gray (yellow on black) colorshecme based on torte.

Plug 'zanglg/nova.vim'																" 24bit colorscheme
Plug 'tomasr/molokai'                                 " Molokai theme

                                                      " Statusline
                                                      " -----------
Plug 'vim-airline/vim-airline'                        " Status line alternative

Plug 'vim-airline/vim-airline-themes'                 " Color themes for airline

                                                      " Backengines
                                                      "
Plug 'w0rp/ale'                                       " Asynchronous Lint Engine

Plug 'Shougo/vimproc.vim', {'do' : 'make'}            " Interactive command execution in Vim.

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
                                                      " --------------------------
                                                      " Language Specific Plugins
                                                      " --------------------------
"                                                       "
"                                                       " Haskell
" Plug 'eagletmt/ghcmod-vim'                            " Integrates with ghc-mod to let you check types from within vim, insert boilerplate code, and lots of other things.
"
"
Plug 'mkasa/neco-ghc-lushtags'                        " Pulls together supertab, lushtags, and ghcmod-vim to drive the tab completion.
"
Plug 'neovimhaskell/neovim-ghcmod'                    " Haskell back-end engine
Plug 'neovimhaskell/haskell-vim'                      " Syntax highlighting and
"                                                       " indentation.
"
Plug 'alx741/vim-hindent'                             " Indentation via hindent
"                                                       " and stylish-haskell
"                                                       " Initialize plugin sy`stem
"
" Plug 'Twinside/vim-hoogle'                            " Run hoogle within nvim
"

Plug 'keith/swift.vim'                                  " Swift syntax highlighting
" Plug 'parsonsmatt/intero-neovim'
Plug 'neomake/neomake'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'ElmCast/elm-vim'                                  " Elm syntax, function completion,
                                                        " documentation
                                                        " lookup, etc...


Plug 'vim-syntastic/syntastic'
Plug 'ryanoasis/vim-devicons'                           " Adds file type glyphs/icons to populr vim plugins}: NERDTree, Airline Powerline Unite, etcc...
call plug#end()

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" Set languaage specific settings
" Go GOLANG
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
" For HAskell
au FileType haskell noexpandtab

syntax enable

source $HOME/.local/share/nvim/plugins/tagbar-haskell.vim
source $HOME/.config/nvim/plugin_settings.vim
