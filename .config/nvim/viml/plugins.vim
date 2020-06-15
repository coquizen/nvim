" Author: Ian G Canino <ian@thecommittedbug.io>
"
" Github: https://github.com/CaninoDev
" License MIT License
"
scriptencoding utf-8

" Install junegunn's plugin manager if not already installed.
augroup init
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -flo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd vimenter * PlugInstall --sync | source $myvimrc
	endif
augroup end

" Get the path of the current vimscript being executed
let s:script_path = expand('<sfile>:p:h')

" A function to source the files in plugins.d by name plus '.vim'
function! s:source(plugins) abort
	execute 'source ' . s:script_path . '/plugins.d/' . a:plugins . '.vim'
endfunction

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

call s:source('backengines')
call s:source('syntax')
call s:source('user-experience')
call s:source('user-interface')

call plug#end()

" Garbage collection
delfunction s:source
unlet s:script_path
