" This file will load the plugin manager (if it doesn't exists) then a select
" of plugins.

" ---------------------------------------------------------------
" | Plugins                                                      |
" ---------------------------------------------------------------
"
"   -----------------
"  / Plugin Manager /
" ------------------

" Check to see if the manager has been installed, if not, then install and run
let vimplug_status = expand(expand("~/.local/share/nvim/site/autoload/plug.vim"))

if !filereadable(vimplug_status)
  if !executable("curl")
    echoerr "You have to installl or first install vim-plug yourself!"
    execute "q!"
  endif

  echo "Installing Vim-Plug..."
  echo ""

  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

"   --------------
"  / Plugins     /
" ---------------

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
"
" General 
" -------
Plug 'mhinz/vim-startify'												" A nice startup page
Plug 'scrooloose/nerdtree'											" A tool to navigate directory tree
Plug 'scrooloose/nerdcommenter'									" A collection of comment functions

" Git Plugins
" ------------
Plug 'airblade/vim-gitgutter'										" Display git diff in margin
"
" Colorschemes
" ------------- 
Plug 'rakr/vim-one'															" 24bit
Plug 'morhetz/gruvbox'													" 24bit
Plug 'lifepillar/vim-solarized8'								" 24bit
Plug 'flazz/vim-colorschemes'										" Various colorschemes
Plug 'jacoborus/tender'													" Another colorscheme

" Statusline
" -----------
Plug 'vim-airline/vim-airline'									" Status line alternative
Plug 'vim-airline/vim-airline-themes'						" Color themes for airline

" Backengines
"
Plug 'w0rp/ale'																	" Asynchronous Lint Engine

" Language Specific Plugins
" --------------------------
"
" Haskell (install via cabal or stack: hindent hlint stylish-haskell
" ghc-mod)
Plug 'neovimhaskell/haskell-vim'								" Syntax highlighting and 
																								" indentation.

Plug 'alx741/vim-hindent'												" Indentation via hindent 
																								" and stylish-haskell
" Initialize plugin system
call plug#end()