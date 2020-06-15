" Define <leader> as '\'
let mapleader="\<space>"

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" [\* ] Search and replace the word under the cursor.
map <leader>* :%s/\<<C-r><C-w>\>//<Left>

" [\xs] Clear search terms.
map <leader>xs <Esc>:noh<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Insert a newline without going into insert mode
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

" Shortcut for splitting windows
noremap <C-w>- :split<CR>
noremap <C-w)\| :vsplit<cr>

" [\v] edit the config files
nnoremap <silent> <leader>vi :tabnew <bar> :NERDTree $HOME/.config/nvim/<CR>

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

" Remap 'c', 'C', 'D', 'x', and 'X' such that only yanks syncs with the system
" clipboard.
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

" Create the :Prettier command to trigger Coc-Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
