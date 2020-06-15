" Author: Ian G Canino
"
"
" Description: an opinionated configuration for neovim based on my usaage
" for Haskell, Swift, and general fullstack development on MacOS. Despite the
" massive list of plugins in this configuration, I highly I recommend reading
" 'Practical Vim: Edit Text at the Speed of Thought'
"
" Plugin Manager: I use junegunn's 'Minimalist Vim Plugin Manager'
"    https://github.com/junegunn/vim-plug
"
" Preamble
let s:script_path = expand('<sfile>:p:h')
" Load Settings
let s:sourceList = [
			\ 'functions',
			\ 'plugins',
			\ 'autocmds',
			\ 'userinterface',
			\ 'textformatting',
			\ 'searchandreplace',
			\ 'filemanagement',
			\ 'keymappings',
			\ 'system',
			\ 'plugins.config',
			\]
for s:item in s:sourceList
	exec 'source ' . s:script_path . '/viml/' . s:item . '.vim'
endfor

" Free memory
unlet s:script_path
unlet s:sourceList
