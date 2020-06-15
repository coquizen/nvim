scriptencoding utf-8
" Modify the highlighting of nontext, specialkey and extrawhitespaces
augroup vimrc
	autocmd!
	autocmd vimrc ColorScheme * :hi NonText ctermfg=236
	autocmd vimrc ColorScheme * :hi SpecialKey ctermfg=23
augroup END

" Return to last cursor position when reopening a file
augroup preserve_last_cursor_position
	autocmd!
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Automatically reload nvim's configuration files when changes are saved. This
" assumes that any writes to a .vim file is in regards to the nvim
" configuration.
augroup auto_reload_nvim_configs
	autocmd!
	autocmd BufWritePost *.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
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
				\ 'markdown',
				\ 'mkd.markdown'
				\ ]
	autocmd!
	" Only strip the trailing whitespaces on save if the file type is not in
	" the aforementioned excludedFileType variable
	autocmd BufWritePre * if index(excludedFileTypes, &ft) < 0 | :%s/\s\+$//e
augroup END

" Vim specific settings
augroup filetype_vim
	autocmd!
	autocmd Filetype vim setlocal foldmethod=marker
	autocmd Filetype vim setlocal tabstop=2
	autocmd Filetype vim setlocal textwidth=80
	autocmd Filetype vim setlocal shiftwidth=2
	autocmd FileType vim setlocal commentstring=\"%s
augroup END

" Zsh specific settings
augroup filetype_zsh
	autocmd!
	autocmd Filetype zsh setlocal tabstop=4
	autocmd Filetype zsh setlocal textwidth=80
	autocmd Filetype zsh setlocal shiftwidth=4
	autocmd FileType zsh setlocal commentstring=\#%s
augroup END
