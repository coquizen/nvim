" Author: Ian G Canino
"
" Description: An opinionated (and evolving) configuration for neovim based on
" my usage. 'Practical Vim: Edit Text at the Speed of Thought'
"
" Plugin Manager: junegunn's 'Minimalist Vim Plugin Manager'
"    https://github.com/junegunn/vim-plug
"
" References:
"     https://github.com/tpope/vim-sensible (General)
"     https://github.com/amix/vimrc (General)
"     https://github.com/ccorbi/lightdotfiles
"
"     HASKELL
"       https://wiki.haskell.org/Vim
"       https://github.com/haskell/haskell-ide-engine
"       https://github.com/johnmendonca/nvim (Haskell)
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

" Define <leader> as '<space>'
let mapleader='\<space>'
let maplocalleader=';'

" Custom augroup
augroup user_events
		autocmd!
augroup END

" Enables 24-bit RGB color in the terminal
if has('termguicolors')
	if empty($COLORTERM) || $COLORTERM =~# 'truecolor\|24bit'
		set termguicolors
	endif
endif
" Disable built-in plugins
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1

let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let g:no_gitrebase_maps = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

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

call plug#begin('~/.local/share/nvim/plugged')   " Specify a directory for plugins


"""""""""""""""
" General
"""""""""""""""
" File system navigation
Plug 'Shougo/defx.nvim'                           " Dark powered file explorer implementation
Plug 'kristijanhusak/defx-git'                    " Git status implementation for Dfx
Plug 'kristijanhusak/defx-icons'                  " Filetype icons for Defx
Plug 'jremmen/vim-ripgrep'                        " Rapid string search through files

" Editor Interfaces
Plug 'lambdalisue/fin.vim'                        " Filter the buffer content in-place
Plug 'mbbill/undotree'                            " Ultimate undoo history visualizer
Plug 'tpope/vim-surround'                         " Wrap current words in tags, quotes, etc..
Plug 'liuchengxu/vim-which-key'                   " Showes key-bindings in pop-up
Plug 'wfxr/minimap.vim'                           " Blazing fast minimap
Plug 'liuchengxu/vista.vim'                       " Viewer & Finder for LSP symbols  and tags
Plug 'Shougo/context_filetype.vim'                " Context filetype detection for nested code

" General UI Improvements
Plug 'itchyny/vim-gitbranch'                      " Lightweight git branch detection
Plug 'itchyny/vim-parenmatch'                     " Efficient alternative to the standard matchparen plugin
Plug 'rafi/vim-sidemenu'                          " Small side-menu useful for terminal users
Plug 'norcalli/nvim-colorizer.lua'                " The fastest Neovim colorizer
Plug 'machakann/vim-highlightedyank'              " Make the yanked region apparent
Plug 'airblade/vim-gitgutter'                     " Display git diff in margin
Plug 'deris/vim-shot-f'                           " Highlight characters to move directly with f/t/F/Tb
Plug 'kshenoy/vim-signature'                      " Display and toggle marks

" Miscellenous
Plug 'wakatime/vim-wakatime'                      " Vim plugin for automatic time tracking and metrics generated from your programming activity.
Plug 'Rom89/thesauraus_query.vim'                 " thesaurus
"Plug 'mhinz/vim-startify'                        " A nice startup page
"Plug 'scrooloose/nerdtree'                       " A tool to navigate directory tree
"Plug 'scrooloose/nerdcommenter'                  " A collection of comment functions
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   " Extra syntax and highlight for nerdtree files
"Plug 'majutsushi/tagbar'                        " Displays tags on the right side of the screen and lets you navigate through them.
"Plug 'airblade/vim-rooter'                      " Changes Vim working directory to project root (identified by presence of known directory or file).
"Plug 'junegunn/vim-easy-align'                   " A vim alignment plugin
"Plug 'ervandew/supertab'                        " Tab completion that integrates with neco-ghc-lushtags to let you do language-aware tab completion.
"Plug 'simnalamburt/vim-mundo'                    " Vim undo tree visualizer
"Plug 'tommcdo/vim-lion'                         " A simple alignment operator for Vim text editor
"Plug 'sjl/vitality.vim'                         " Integrate vim nicely with tmux and iterm2
"Plug 'Shougo/denite.nvim'                       " Dark powered asynchronous unite all interfaces for Neovim
"Plug 'metakirby5/codi.vim'                      " Interactive scratchpad
"Plug 'tpope/vim-projectionist'                  " projectionist.vim: project configuration
"Plug 'tpope/vim-dispatch'                       " Asynchronous build and test dispatcher
"Plug 'radenling/vim-dispatch-neovim'            " Adds neovim support to vim-dispatch
Plug 'chrisbra/Colorizer'                        " color hex codes and color names
"Plug 'janko-m/vim-test'                         " Run your tests at the speed of thought
"Plug 'Shougo/neosnippet.vim'                    " neo-snippet plugin
"Plug 'honza/vim-snippets'                       " vim-snipmate default snippets (Previously snipmate-snippets)
"Plug 'Chiel92/vim-autoformat'                   " Provide easy code formatting in Vim by integrating existing code formatters.
"Plug 'sbdchd/neoformat'                         " A (Neo)vim plugin for formatting code.
"Plug 'lambdalisue/suda.vim'                     " Until neovim fixes sudo, this is a workaround
"Plug 'junegunn/limelight.vim'                    " Hyperfocus-writing in Vim.
Plug 'dhruvasagar/vim-table-mode'                " Table mode

" Terminal interaction
"Plug 'benmills/vimux'                           " vim plugin to interact with tmux
" Plug 'christoomey/vim-tmux-navigator'
"Plug 'zenbro/mirror.vim'                        " Simultaneously work on two files at once
" Plug 'vim-jp/vital.vim'
" Plug 'haya14busa/vital-string-interpolation'

" Git
"Plug 'junegunn/gv.vim'                          " Git commit browser
"Plug 'tpope/vim-fugitive'                       " a Git wrapper so awesome, it should be illegal

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'                " Papercolor theme
Plug 'rakr/vim-one'                              " 24bit
Plug 'morhetz/gruvbox'                           " 24bit
Plug 'lifepillar/vim-solarized8'                 " 24bit
Plug 'icymind/NeoSolarized'                      " 24bit
Plug 'flazz/vim-colorschemes'                    " Various colorschemes
Plug 'jacoborus/tender'                          " Another colorscheme

Plug 'KnoP-01/tortus'                            " Dark gray (yellow on black) colorshecme based on torte.
Plug 'zanglg/nova.vim'                           " 24bit colorscheme
Plug 'tomasr/molokai'                            " Molokai theme
Plug 'protesilaos/tempus-themes-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'nanotech/jellybeans.vim'
Plug 'icymind/NeoSolarized'

"""""""""""""""
" Backengines "
"""""""""""""""
" Completion & Code-Analysis
Plug 'prabirshrestha/async.vim'                  " Normalize async job control API
Plug 'prabirshrestha/asyncomplete.vim'           " Async completion in Vimscript
Plug 'prabirshrestha/asyncomplete-lsp.vim'       " Provide LSP autocompletion source
Plug 'prabirshrestha/vim-lsp'                    " Async LSP plugin
Plug 'mattn/vim-lsp-settings'                    " Auto LSP configurations for vim-lsp
Plug 'Raimondi/delimitMate'                      " Auto-completion for quotes, parens, brackets

" Langugage Specific Plugins {{{
" VimScript
Plug 'Shougo/neco-vim'                           " Completion source for VimScript
Plug 'prabirshrestha/asyncomplete-necovim.vim'   " Provides syntax autocomplete via neco-vim
Plug 'vim-jp/syntax-vim-ex'                      " Improved VimScript syntax highlighting

" Ansible
Plug 'pearofducks/ansible-vim'                   " Improved YAML support for Ansible

" Tmux Config
Plug 'tmux-plugins/vim-tmux'                     " Plugin for tmux.conf

" ZSH
Plug 'chrisbra/vim-zsh'                          " Syntax highlighting for zshrc files

" CSS
Plug 'hail2u/vim-css3-syntax'                    " Extend built-in CSS support for CSS3
Plug 'othree/csscomplete.vim'                    " Updated CSS autocomplete
Plug 'cakebaker/scss-syntax.vim'                 " Syntax file for scss

" HTML
Plug 'othree/html5.vim'                          " HTML5 omnicomplete and syntax

" Javascript
Plug 'pangloss/vim-javascript'                   " Enhanced Javascript syntax
Plug 'MaxMEllon/vim-jsx-pretty'                  " React JSX syntax pretty highlighing

" GraphQL
Plug 'jparise/vim-graphql'                       " GraphQL file detection, syntax highlighing, and indentation

" NodeJS
Plug 'moll/vim-node'                             " Superb development with Node JS

" JSON
Plug 'elzr/vim-json'                             " Better JSON support

" Log files (generic)90
Plug 'MTDL9/vim-log-highlighting'                " Syntax highlighting for generic log files

" GO
Plug 'fatih/vim-go',                             " Go development plugin for Vim
			\ { 'do': ':GoInstallBinaries' }
" }}}

" Denite
Plug 'Shougo/denite.nvim'                        " Dark powered asynchronous unite all interfaces for Neovim
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'chemzqm/unite-location'

" Status Line
"Plug 'vim-airline/vim-airline'                   " Status line alternative
"Plug 'vim-airline/vim-airline-themes'            " Color themes for airline
"Plug 'ryanoasis/vim-devicons'                    " Adds file type glyphs/icons to populr vim plugins}: NERDTree, Airline Powerline Unite, etcc...
"Plug 'junegunn/vim-peekaboo'
call plug#end()
" }}}

"   Settings {{{
" ------------------------------------
" Shougo/denite.nvim
source ~/.config/nvim/denite.vim

"  prabirshrestha/vim-lsp
source ~/.config/nvim/lsp.vim
let g:lsp_auto_enable = 1
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
augroup User lsp_float_opened
		autocmd!
		nmap <buffer> <silent> <Esc> <Plug>(lsp-preview-close)
augroup END
augroup User lsp_float_closed
		silent! nunmap <buffer> <Esc>
augroup END
augroup user_events FileType markdown.lsp-hover
				\ nmap <silent><buffer>q :pclose<CR>| doautocmd <nomodeline> BufWinEnter
augroup END

" benmills/vimux
let g:VimuxHeight = "10"

" pangloss/vim-javascript
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" vim-jp/syntax-vim-ex
let g:vimsyntax_noerror = 1
let g:vim_indent_cont = &shiftwidth
"
" ale setting
"let g:ale_linters = {
"			\ 'javascript': ['eslint'],
"			\}
"
"let g:ale_fixers = {
"			\ 'javascript': ['prettier', 'eslint']
"			\ }
"
"" Shougo/defx
source ~/.config/nvim/defx.vim

" chrisbra/Colorizer
let g:colorizer_auto_color = 1

" Raimondi/delimitMate
imap <buffer><expr> <C-Tab> delimitMate#JumpAny()
let g:delimitMate_expand_cr = 0
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_excluded_ft = 'mail,txt,denite-filter,clap_input'
augroup user_plugin_delimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
augroup END

" airblade/vim-gitgutter
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)
nmap gS <Plug>(GitGutterStageHunk)
xmap gS <Plug>(GitGutterStageHunk)
nmap <Leader>gr <Plug>(GitGutterUndoHunk)
nmap gs <Plug>(GitGutterPreviewHunk)

let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▍'
let g:gitgutter_sign_removed_first_line = '▘'
let g:gitgutter_sign_removed_above_and_below = '_¯'
let g:gitgutter_sign_modified_removed = '▍'
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_sign_priority = 0
let g:gitgutter_override_sign_column_highlight = 0

" rafi/sidemenu.vim
nmap <Leader>l <Plug>(sidemenu)
xmap <Leader>l <Plug>(sidemenu-visual)

" kshenoy/vim-signature
let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:SignatureMap = {
				\ 'Leader':            'm',
				\ 'ListBufferMarks':   'm/',
				\ 'ListBufferMarkers': 'm?',
				\ 'PlaceNextMark':     'm,',
				\ 'ToggleMarkAtLine':  'mm',
				\ 'PurgeMarksAtLine':  'm-',
				\ 'DeleteMark':        'dm',
				\ 'PurgeMarks':        'm<Space>',
				\ 'PurgeMarkers':      'm<BS>',
				\ 'GotoNextLineAlpha': "']",
				\ 'GotoPrevLineAlpha': "'[",
				\ 'GotoNextSpotAlpha': '`]',
				\ 'GotoPrevSpotAlpha': '`[',
				\ 'GotoNextLineByPos': "]'",
				\ 'GotoPrevLineByPos': "['",
				\ 'GotoNextSpotByPos': 'mn',
				\ 'GotoPrevSpotByPos': 'mp',
				\ 'GotoNextMarker':    ']-',
				\ 'GotoPrevMarker':    '[-',
				\ 'GotoNextMarkerAny': ']=',
				\ 'GotoPrevMarkerAny': '[=',
				\ }
let g:SignatureForceRemoveGlobal = 0
let g:SignatureUnconditionallyRecycleMarks = 1
let g:SignatureErrorIfNoAvailableMarks = 0
let g:SignaturePurgeConfirmation = 0
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
let g:SignatureIncludeMarkers = repeat('⚐', 10)
autocmd user_events User GitGutter call signature#sign#Refresh()

" mbbill/undotree
nnoremap <Leader>gu :UndoTreeToggle<CR>

" Ron90/thesaurus_query
nnoremap <silent> <Leader>T :<C-u>ThesaurusQueryReplaceCurrentWord<CR>
" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_default_mapping = 0
let g:indent_guides_tab_guides = 0
let g:indent_guides_color_change_percent = 3
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = [
						\ 'help', 'man', 'fern', 'defx', 'denite', 'denite-filter', 'startify',
						\ 'vista', 'vista_kind', 'tagbar', 'lsp-hover', 'clap_input', 'fzf',
						\ 'any-jump', 'gina-status', 'gina-commit', 'gina-log', 'minimap',
						\ 'quickpick-filter', 'lsp-quickpick-filter'
						\ ]
autocmd user_events FileType * ++once IndentGuidesEnable

" norcalli/nvim-colorizer.lua
if has('nvim-0.4')
		luafile ~/.config/nvim/colorizer.lua
endif

" prabirshrestha/asyncomplete.vim
let g:asyncomplete_auto_completeopt = 0
source ~/.config/nvim/asyncomplete.vim


"  mattn/vim-lsp-settings
if ! g:lsp_auto_enable
		call lsp#enable()
endif
let g:lsp_settings = {
						\   'yaml-language-server': {
						\'allowlist': ['yaml', 'yaml.ansible'],
						\   }
						\ }


" Statusline
source ~/.config/nvim/badge.vim
" Tabline
source ~/.config/nvim/tabline.vim
"
"
" jacoborus/tender
"let g:airline_theme = "tender"
" simnalamburt/vim-mundo
"let g:mundo_close_on_revert = 1                   " Set to 1 to automatically close the Mundo windows when revertin

" vim-ruby/vim-ruby
"let g:ruby_indent_block_style = 'do'
"let g:ruby_spellcheck_strings = 1

" nanotech/jellybean.vim
"let g:jellybeans_use_term_italics = 1

" airblade/vim-root
"let g:rooter_patterns = [ '.learn' ]

" dense-analysis/ale
"
" drewtempelmeyer/palenight.vim
"let g:airline_theme = "palenight"

" kyoz/purify
"let g:airline_theme = "purify"

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

" lambdalisur/fin.vim
nnoremap <Leader>f :<C-u>Fin<CR>
function! InitFin() abort
		cmap <buffer><nowait> <Tab> <Plug>(fin-line-next)
		cmap <buffer><nowait> <S-Tab> <Plug>(fin-line-prev)
		cmap <buffer><nowait> <C-j> <Plug>(fin-line-next)
		cmap <buffer><nowait> <C-k> <Plug>(fin-line-prev)
endfunction
autocmd user_events FileType fin call InitFun()

" junegunn/vim-easy-align Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" prabirshrestha/asyncomplete-necovim.vim
autocmd User asyncomplete_setup call asyncomplete#register_source(
      \ asyncomplete#sources#necovim#get_source_options({
      \ 'name': 'necovim',
      \ 'allowlist': ['vim'],
      \ 'completor': function('asyncomplete#sources#necovim#completor'),
      \ }))
" janko-m/vim-test
"let test#strategy = "dispatch"
"let test#ruby#bundle_exec = 0
"
" wfxr/minimap.vim
let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'defx']

" liuchengxu/vista.vim
nnoremap <silent> <Leader>b :<C-u>Vista<CR>
nnoremap <silent> <Leader>a :<C-u>Vista Show<CR>

let g:vista#renderer#enable_icon = 1
let g:vista_echo_cursor_strategy = 'scroll'
let g:vista_vimwiki_executive = 'markdown'
let g:vista_executive_for = {
						\ 'vimwiki': 'markdown',
						\ 'pandoc': 'markdown',
						\ 'markdown': 'toc',
						\ }
" machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 200

" pearofducks/ansible-vim
let g:ansible_extra_keywords_highlight = 1
let g:ansible_template_syntaxes = {
						\   '*.json.j2': 'json',
						\   '*.(ba)?sh.j2': 'sh',
						\   '*.ya?ml.j2': 'yaml',
						\   '*.xml.j2': 'xml',
						\   '*.conf.j2': 'conf',
						\   '*.ini.j2': 'ini'
						\ }

" maxMEllon/vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1
" othree/html5
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

"" vim-syntastic/syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"" Setup for javascript
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'
"" scrooloose/nerdtree
"autocmd StdinReadPre * let s:std_in=1                                              " Open NERDTree if nvim opens on a directory
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"let NERDTreeIgnore=['.DS_Store']
"let NERDTreeRespectWildIgnore = 1                                                  " Refer to wildignore for additional files
"let NERDTreeHighlightCursorLine = 1                                                " Highlight the selected entry in the tree
"let NERDTreeQuitOnOpen = 0                                                         " Don't quit NERDtree when opening a file
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" Close vim if the only window left open is a NERDTree<Paste>
"let NERDTreeMinimalUI = 1                                                          " Pretty NERDTree UI
"let NERDTreeDirArrows = 1
"
"" scrooloose/nerdtreecommenter
"let g:NERDCompactSexyComs = 1                                                      " Use compact syntax for prettified multi-line comments
"
" emajutsushi/tagbar
"autocmd FileType haskell nested :TagbarOpen                                       " Configure tagbar for hasktags
" let g:tagbar_type_haskell = {
" \ 'ctagsbin'  : 'hasktags',
" \ 'ctagsargs' : '-x -c -o-',
" \ 'kinds'     : [
" \  'm:modules:0:1',
" \  'd:data: 0:1',
" \  'd_gadt: data gadt:0:1',
" \  't:type names:0:1',
" \  'nt:new types:0:1',
" \  'c:classes:0:1',
" \  'cons:constructors:1:1',
" \  'c_gadt:constructor gadt:1:1',
" \  'c_a:constructor accessors:1:1',
" \  'ft:function types:1:1',
" \  'fi:function implementations:0:1',
" \  'o:others:0:1'
" \ ],
" \ 'sro'        : '.',
" \ 'kind2scope' : {
" \ 'm' : 'module',
" \ 'c' : 'class',
" \ 'd' : 'data',
" \ 't' : 'type'
" \ },
" \ 'scope2kind' : {
" \ 'module' : 'm',
" \ 'class'  : 'c',
" \ 'data'   : 'd',
" \ 'type'   : 't'
" \ }
" \ }
"
" fatih/vim-go
"let g:go_fmt_command = "goimports"                                                " duto import packages when file is saved
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_term_enabled = 1                                                          " This option is Neovim only. Use it
" to change the behavior of the test
" commands. If set to 1 it opens the
" test commands inside a new terminal
" according to |'g:go_term_mode'|,
" otherwise it will run them in the
" background just like `:GoBuild`.
let g:go_list_type = "quickfix"                                                    " An issue with `vim-go` and `syntastic`
" is that the location list window
" that contains the output of commands
" such as `:GoBuild` and `:GoTest` might
" not appear.
let g:go_addtags_transform = "camelcase"                                           " By default 'snakecase' is used.
" Possible values are: ["snakecase", camelcase                                     " ].
let g:go_auto_sameids = 0                                                          " This option will highlight al0
" uses of the identifier under the
" cursor (:GoSameIds) automatically.
let g:go_auto_type_info = 1                                                        " Automatically display type of the

" variable under cursor on the status line

" autozimu/LanguageClient-neovim
"let g:LanguageClient_serverCommands = { 'go': ['gopls'], }
"" vim-airline/vim-airline
"let g:airline#extensions#quickfix#location_text = 'Location'
"" Define the loclist label
"let g:airline#extensions#quickfix#quickfix_text =  'Quickfix'
"" Define the quickfix label
"let g:airline#extensions#tabline#enabled = 1                                       " Enable enhanced tabline
"let g:airline_powerline_fonts = 1                                                  " Use powerline symbols
"if !exists('g:airline_symbols')
"	let g:airline_symbols = {}
"endif
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = 'Ɇ'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_theme='papercolor'                                                   " set the theme
"


" ryanoasis/vim-devicons
let g:webdevicons_enable= 1                                                        " enable the plugin
let g:webdevicons_enable_nerdtree = 1                                              " adding the flags to NERDTree
let g:webdevicons_enable_airline_tabline = 1                                       " adding to vim-airline's tabline
let g:webdevicons_enable_airline_statusline = 1                                    " adding to vim-airline's statusline

" Junegunn/fzf
let $FZF_DEFAULT_COMMAND =  'rg --files --hidden 2>/dev/null'
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,
						\ bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,
						\ spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Shougo/deoplete.vim
if has('nvim')
	let g:deoplete#enable_at_startup = 1                                             " enable deoplete at startup
endif
let g:deoplete#enable_camel_case = 1                                               " Enable camel case completion
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const'] " For GOLANG
let g:deoplete#sources#go#align_class = 1

" neomake/neomake
" autocmd BufWritePost * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}           " Customize the labels for neomake
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
" For GOLANG
"let g:neomake_go_gometalinter_maker = {
			"\ 'args': [
			"\   '--tests',
			"\   '--enable-gc',
			"\   '--concurrency=3',
			"\   '--fast',
			"\   '-D', 'aligncheck',
			"\   '-D', 'dupl',
			"\   '-D', 'gocyclo',
			"\   '-D', 'gotype',
			"\   '-E', 'errcheck',
			"\   '-E', 'misspell',
			"\   '-E', 'unused',
			"\   '%:p:h',
			"\ ],
			"\ 'append_file': 0,
			"\ 'errorformat':
			"\   '%E%f:%l:%c:%trror: %m,' .
			"\   '%W%f:%l:%c:%tarning: %m,' .
			"\   '%E%f:%l::%trror: %m,' .
			"\   '%W%f:%l::%tarning: %m'
			"\ }
let g:table_mode_corner_corner='+'                                                 " Customize the labels for
                                                                                   " neomake

" dhruvasagar/vim-table-mode
let g:table_mode_header_fillchar='='

" }}}

" ---------------------------------------------------------------
" |
" | General {{{
" |
" ---------------------------------------------------------------

" System Settings
" ------------------------------------
set nocompatible                                                                   " Don't make nvim vi-compatible
set clipboard=unnamedplus                                                          " OS dependent clipboard settings
if has('mac') && has('vim_starting')
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

if has('clipboard') && has('vim_starting')
		set clipboard& clipboard^=unnamed,unnamedplus
endif
set mouse=a                                                                        " Enable mouse over all modes
"set shell=bash/ -i                                                                " for the live markdown plugin
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim                                    " Running :Lint will run golint
set hidden                                                                         " Allow abandoning an
                                                                                   " unsaved buffer when opening
                                                                                   " another one.
" Colors and Fonts
" ------------------------------------
" Enables 24-bit RGB color in the terminal
if has('termguicolors')
	if empty($COLORTERM) || $COLORTERM =~# 'truecolor\|24bit'
		set termguicolors
	endif
endif
if (has("termguicolors"))                                                          " ┐ Attempt to set
	set termguicolors                                                                " │ 24 bit colors,
	colorscheme purify                                                               " │ and enable a 24 bit colorscheme
else                                                                               " │ otherwise, set a sane scheme
	colorscheme molokai                                                              " │
endif                                                                              " ┘
set background=dark                                                                " Set the overall interface dark

" User Interface
" ------------------------------------
set backspace=indent                                                               " ┐ Allow 'backspace'
set backspace+=eol                                                                 " │ in insert mode over
set backspace+=start                                                               " ┘ everything.
set showcmd                                                                        " Show the command being typed.
set cmdheight=2                                                                    " Set the command section height to
                                                                                   " two lines; useful when there are
																																									 " multiple error messages
set formatoptions+=1                                                               " Don't break lines after a one letter word
set formatoptions-=t                                                               " Don't autowrap text
set viewoptions=folds,cursor,curdir,slash,unix                                     " What to save for views and sessions"
set sessionoptions=curdir,help,tabpages,winsize

"set inccommand=nosplit                                                            " Neovim highlight
"set colorcolumn=80                                                                " Set a vertical line at the 80th column.
let &colorcolumn="80,".join(range(120,999),",")                                    " Set margins at 80 and 120 columns
hi ColorColumn ctermbg=235 guibg=#2c2d27
set cursorline                                                                     " Highlight the current line
hi CursorLine cterm=bold gui=bold
hi Comment cterm=italic gui=italic
"set cpoptions+=$                                                                  " When making a change, don't
                                                                                   " redisplay the line, and
                                                                                   " instead, put a `$` sign at
                                                                                   " the end of the changed text.
set laststatus=2                                                                   " Always show the status line
set lazyredraw                                                                     " Do not redraw the screen while
                                                                                   " executing macros, registers
                                                                                   " and other commands that have
                                                                                   " not been typed.
set textwidth=80                                                                   " The standard setting for most text
                                                                                   " files is to set the line width at
																																									 " 80.
set list                                                                           " Display invisible characters as follows:
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,nbsp:␣
"set listchars=tab:▸\                                                              " ┐
"set listchars+=trail:·                                                            " │ Use custom symbols to
"set listchars+=eol:↴                                                              " │ represent invisible characters.
"set listchars+=nbsp:_                                                             " ┘
set nojoinspaces                                                                   " When using the join command
                                                                                   " only insert a single space
                                                                                   " after a `.`, `?`, or `!`.
set modeline                                                                       " Allow for per-file specific settings
set number                                                                         " Show line number
set numberwidth=5                                                                  " Increase the minimal number
                                                                                   " columns used for the `line
                                                                                   " number`.
set report=2                                                                       " Display the count of lines yanked
                                                                                   " or deleted
"set relativenumber                                                                " Use relative line numbers.
                                                                                   " Current line is still in
                                                                                   " status bar. (Disabled for more dynamic
                                                                                   " use of this setting. See below)
set ruler                                                                          " Show cursor position
set noshowmode                                                                     " Don't show the current mode
                                                                                   " (airline.vim will handle
                                                                                   " this)
"set nostartofline                                                                 " Keep the cursor on the
                                                                                   " on the same column when navigating
                                                                                   " between Lines.
set scrolloff=5                                                                    " When scrolling, keep the
                                                                                   " cursor 5 lines below the
                                                                                   " top and 5 lines above the
                                                                                   " bottom of the screen.
set guioptions-=R                                                                  " No right scroll bar
set guioptions-=L                                                                  " No left scrool bar
set showmatch                                                                      " Highlight matching brackets
set spelllang=en_us                                                                " Set the spell-check language.
set splitbelow                                                                     " ┐ More intuitive window placement
set splitright                                                                     " ┘
set synmaxcol=2500                                                                 " Limit syntax highlighting
                                                                                   " (this avoids the very slow
                                                                                   " redrawing when files contain
                                                                                   " long lines).
set title                                                                          " Show the filename in the
                                                                                   " window title bar.
"set virtualedit=all                                                               " Allow cursor to be anywhere.
set wildmenu                                                                       " Enable enhanced command-line
                                                                                   " completion (by hitting <TAB>
                                                                                   " in command mode, Vim will
                                                                                   " show the possible matches
                                                                                   " just above the command
                                                                                   " line with the first match
                                                                                   " highlighted.
"set winminheight=0                                                                " Allow windows to be squashed;
set noshowmode                                                                     " Don't show mode in command window
set pumheight=15                                                                   " Minimum height for pop-up window
set showcmd                                                                        " show command in status line
set laststatus=2                                                                   " always show a status line
" Pseudo-transparency for completion menu and floating windows
if has('termguicolors') && &termguicolors
	if exists('&pumblend')
		set pumblend=10
	endif
	if exists('&winblend')
		set winblend=10
	endif
endif
set wrap                                                                           " Enable Linewrapping
set linebreak
set breakat=\ \ ;:,!?                                                              " Long line break characters
set nostartofline                                                                  " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~                                                       " Move to following line on certain ke Move to following line on certain keyss
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview
set completeopt+=longest,menuone                                                    " auto complete setting
" Use the new Neovim :h jumplist-stack
if has('nvim-0.5')
	set jumpoptions=stack
endif
" Text, Tab, and Indent Related
" ------------------------------------
filetype plugin indent on                                                          " set the tab settings according to filetyoe
set autoindent                                                                     " Use same indenting on new lines
set tabstop=2                                                                      " ┐ Tab characters to appear 3 spaces wide
set smarttab                                                                       " │ Enable the tab key to go to next tabstop
set softtabstop=2                                                                  " │ Make the tab key insert comb. of spcs
set shiftwidth=4                                                                   " │ and tabs to simulate tab stops
                                                                                   " │ Size of the 'indent'
set expandtab                                                                      " ┘ Use spaces instead of tab
set showtabline=2                                                                  " Always show tab bar.

set shiftround                                                                     " round indent to multiple of shiftwidth
set foldmethod=indent                                                              " Set the fold to be determined by indents
set foldlevel=99

" Timing
" ------------------------------------
"
set timeout ttimeout
set timeoutlen=500                                                                 " Timeout on mappings
set ttimeoutlen=10                                                                 " Timeout on keycodes
set updatetime=400                                                                 " Idle time to write swap and trigger CursorHold
set redrawtime=2000                                                                " Time in milliseconds for stopping redraw
" Seach and Replace
" ------------------------------------
set gdefault                                                                       " Default add g flag to
																																								   " search/replace. Add `g` to
                                                                                   " toggle.
set hlsearch                                                                       " Highlight all search matches
hi Search cterm=bold gui=bold
set ignorecase                                                                     " Ignore case in search patterns.
set incsearch                                                                      " Highlight search pattern as
                                                                                   " it is being typed.
set magic                                                                          " Enable extended regexp.
set smartcase                                                                      " Override `ignorecase` option
                                                                                   " if the search pattern
                                                                                   " contains uppercase
                                                                                   " characters.
set wrapscan                                                                       " Searches wrap around the end of the file
" File Settings
" ------------------------------------
set encoding=utf-8                                                                 " Use UTF-8 without BOM
set fileencoding=utf-8
set binary                                                                         " Enables reading of binary
set wildignore+=*.jpeg                                                             " ┐
set wildignore+=*.gif                                                              " │
set wildignore+=*.png                                                              " │
set wildignore+=*.gif                                                              " │
set wildignore+=*.psd                                                              " │
set wildignore+=*.o                                                                " │Ignore these filetypes
set wildignore+=*.obj                                                              " │
set wildignore+=*.min.js                                                           " │
set wildignore+=*/bower_c*/*                                                       " │
set wildignore+=*/node_m*/*                                                        " │
set wildignore+=*/vendor/*                                                         " │
set wildignore+=*/.git/*                                                           " │
set wildignore+=*/.hg/*                                                            " │
set wildignore+=*/.svn/*                                                           " │
set wildignore+=*/log/*                                                            " │
set wildignore+=*.hi                                                               " │
set wildignore+=xmonad.state                                                       " │
set wildignore+=xmonad.errors                                                      " │
set wildignore+=prompt-history                                                     " │
set wildignore+=*/tmp/*                                                            " ┘

let g:ftplugin_sql_statements = 'create,alter'
let g:sql_type_default = 'mysql'

" Status line
let s:stl  = " %7*%{&paste ? '=' : ''}%*"         " Paste symbol
let s:stl .= "%4*%{&readonly ? '' : '#'}%*"       " Modified symbol
let s:stl .= "%6*%{badge#mode('🔒', '🔎')}"       " Read-only symbol
let s:stl .= '%*%n'                               " Buffer number
let s:stl .= "%6*%{badge#modified('+')}%0*"       " Write symbol
let s:stl .= ' %1*%{badge#filename()}%* '         " Filename
let s:stl .= '%<'                                 " Start truncating here
let s:stl .= '%( %{badge#branch()} %)'           " Git branch name
let s:stl .= '%4*%(%{badge#syntax()} %)%*'        " Syntax lint
let s:stl .= "%4*%(%{badge#trails('␣%s')} %)%*"   " Whitespace
let s:stl .= '%3*%(%{badge#indexing()} %)%*'      " Indexing indicator
let s:stl .= '%3*%(%{badge#gitstatus()} %)%*'     " Git status
let s:stl .= '%='                                 " Align to right
let s:stl .= '%{badge#format()} %4*%*'           " File format
let s:stl .= '%( %{&fenc} %)'                     " File encoding
let s:stl .= '%4*%*%( %{&ft} %)'                 " File type
let s:stl .= '%3*%2* %l/%2c%4p%% '               " Line and column

" Non-active Statusline
let s:stl_nc = " %{badge#mode('🔒', 'Z')}%n"   " Read-only symbol
let s:stl_nc .= "%6*%{badge#modified('+')}%*"  " Unsaved changes symbol
let s:stl_nc .= ' %{badge#filename()}'         " Relative supername
let s:stl_nc .= '%='                           " Align to right
let s:stl_nc .= '%{&ft} '                      " File type

" Status-line blacklist
let s:statusline_filetypes_ignore = get(g:, 'statusline_filetypes_ignore',
	\ 'defx\|denite\|vista\|undotree\|diff\|sidemenu\|qf')

let s:statusline_filetypes = get(g:, 'statusline_filetypes', {
	\ 'defx': ['%{fnamemodify(getcwd(), ":t")}%=%l/%L'],
	\ 'magit': [
	\   '%y %{badge#gitstatus()}%<%=%{fnamemodify(badge#filename(), ":~")}%=%l/%L',
	\   '%y %{badge#gitstatus()}%= %l/%L'],
	\ 'minimap': [' '],
	\ 'denite-filter': ['%#Normal#'],
	\ })

" s:set_state replaces current statusline
function! s:set_state(filetype, index, default)
	" Skip statusline render during session loading
	if &previewwindow || exists('g:SessionLoad') "|| empty(a:filetype)
		return
	endif
	if has_key(s:statusline_filetypes, a:filetype)
		let l:states = s:statusline_filetypes[a:filetype]
		let l:want = get(l:states, a:index, l:states[0])
		if &l:statusline != l:want
			let &l:statusline = l:want
		endif
	elseif a:filetype !~# s:statusline_filetypes_ignore
		if &l:statusline != a:default
			let &l:statusline = a:default
		endif
	endif
endfunction

"
" Bind to Vim events
augroup user_statusline
	autocmd!

	" Set active/inactive statusline templates
	autocmd VimEnter,ColorScheme, * let &l:statusline = s:stl
	autocmd FileType,WinEnter,BufWinEnter * call s:set_state(&filetype, 0, s:stl)
	autocmd WinLeave * call s:set_state(&filetype, 1, s:stl_nc)

	" Redraw on Vim events
	autocmd FileChangedShellPost,BufFilePost,BufNewFile,BufWritePost * redrawstatus

	" Redraw on Plugins custom events
	autocmd User ALELintPost,ALEFixPost redrawstatus
	autocmd User NeomakeJobFinished redrawstatus
	autocmd User GutentagsUpdating redrawstatus
	autocmd User CocStatusChange,CocGitStatusChange redrawstatus
	autocmd User CocDiagnosticChange redrawstatus
	" autocmd User lsp_diagnostics_updated redrawstatus

	" if exists('##LspDiagnosticsChanged')
	" 	autocmd LspDiagnosticsChanged * redrawstatus
	" endif
augroup END
" Backups, Undo's, Swaps Oh My!
" ------------------------------------
if !strlen($SUDO_USER)                                                             " For system security, test to see
                                                                                   " if nvim was invoked by sudo. Sensitive
                                                                                   " files should not leave traces around
                                                                                   " in user's directory.
																																									 "
	set backup                                                                       " Keep the backup file of current file
                                                                                   " before recent save.
	if !isdirectory($HOME . "/.local/share/nvim/backup")
		call mkdir($HOME . "/.local/share/nvim/backup", "p")
	endif

	set backupdir=~/.local/share/nvim/backup//                                       " The double slash at the end
                                                                                   " of the directory prods Vim into keeping
                                                                                   " full path to the file in its undo filename
                                                                                   " to avoid collisions. This is used
                                                                                   " to same effect for undo files. (See below)
	set undofile                                                                     " enable undo file but in a different directory
	if !isdirectory($HOME . '/.local/share/nvim/undo')
		call mkdir($HOME . '/.local/share/nvim/undo', 'p', 0700)
	endif
	set undodir^=~/.local/share/nvim/undo//                                          " Location of the undo history
                                                                                   " Have the swap files saved in one
                                                                                   " place instead of cluttering up the
                                                                                   " working directory. (NOT
																																									 " recommended if multiple users are
																																									 " editing the same file)
	if !isdirectory($HOME . '/.local/share/nvim/swap')
		call mkdir($HOME . '/.local/share/nvim/swap', 'p', 0700)
	endif

	set directory^=$HOME/.local/share/nvim/swap//
endif

" Macros
" ------------------------------------
autocmd BufNewFile,BufRead */playbooks/*.{yml,yaml} setfiletype yaml.ansible
autocmd BufNewFile,BufRead */inventory/* setfiletype ansible_hosts
augroup user_events
	autocmd!
augroup END

" Check if file changes when its window is in focus
augroup user_plugin_filetype
		autocmd!

		"Check for file change on focus
		autocmd FocusGained * checktime

		autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endif

		" Neovim terminal settings (only with neovim .5)
		if has('nvim-0.5')
				autocmd TermOpen & setlocal modifiable
				try
						autocmd TextYankPost *
												\ silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
				endtry
		endif

		" Update filetype on save if empty
		autocmd BufWritePost * nested
								\ if &l:filetype ==# '' || exists('b:ftdetect')
								\ |	unlet! b:ftdetect
								\ |	filetype detect
								\ endif
" Automatically reload nvim's configuration files when changes are saved
	autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
							\ so $MYVIMRC | redraw

	" Highlight current line only on focused window, unless:
	" " 1. Cursor-line is already set to wanted value
	" " 2. Denite or Clap buffers
	" " 3. Preview window
	" " 4. Completion popup menu is visible
		autocmd WinEnter,BufEnter,InsertLeave *
								\ if ! &cursorline && &filetype !~# '^\(denite\|clap_\|.*quickpick\)'
								\      && ! &previewwindow && ! pumvisible()
								\ | setlocal cursorline
								\ | endif
		autocmd WinLeave,BufLeave,InsertEnter *
							\ if &cursorline && &filetype !~# '^\(denite\|clap_\|.*quickpick\)'
							\      && ! &previewwindow && ! pumvisible()
							\ | setlocal nocursorline
							\ | endif

		" Update diff comparison on insert mode exit
		autocmd InsertLeave * if &l:diff | diffupdate | endif

		" Agressive window resize
		autocmd VimResized * wincmd =

		" Force write shada on leaving nvim
		autocmd VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif

		" Reload Vim script automatically if setlocal autoread
		autocmd BufWritePost,FileWritePost *.vim nested
						\ if &l:autoread > 0 | source <afile>
						\ | echo 'source ' . bufname('%')
						\ endif

		" When editing a file, always jump to last known cursor position
		autocmd BufReadPost *
							\ if index(['gitcommit', 'gitrebase', 'svn', 'hgcommit'], &buftype) == -1 &&
							\      index(['quickfix', 'nofile', 'help'], &buftype) == -1 &&
							\      ! &diff && ! &previewwindow &&
							\      line("'\"") > 0 && line("'\"") <= line("$")
							\|	if line("w$") == line("$")
						  \|			execute "normal! g`\""
							\|	elseif line("$") - line("'\"") > ((line("w$") - line("w0")) / 2) - 1
						  \|		execute "normal! g`\"zz"
							\|  else
							\|     execute "normal! \G'\"\<c-e>"
							\|  endif
							\|	if foldclosed('.') != -1
							\|     execute 'normal! zvzz'
							\|  endif
							\|endif

		autocmd FileType crontab setlocal nobackup nowritebackup

		autocmd FileType gitcommit setlocal spell

		autocmd FileType gitcommit,qfreplace setlocal nofoldenable

		autocmd FileType markdown setlocal expandtab spell conceallevel=0
						\ | setlocal autoindent formatoptions=tcroqn2 comments=n:>

		autocmd FileType css,javascript,javascriptreact setlocal backupcopy=yes
augroup END

" Modify the highlighting of nontext, specialkey and ext	rawhitespaces
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

augroup xfree86config
	au BufNewFile,BufRead */xorg.conf.d/*.conf
				\ let b:xf86conf_xfree86_version=4
				\
augroup END

	" The following setup will automatically run tests when a test file or its alternate application file is saved:
	"augroup test
	"autocmd!
	"autocmd BufWrite * if test#exists() | TestFile endif
	"
	"augroup END

" Automatically format .go files on write.
augroup golang
	autocmd!
	autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting()
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

" This function creates a floating fzf window when activated
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

" This function checks to see if the cursor is at the start of a line. Being used for detecting whether to go into
" table mode.
function! s:isAtStartOfLine(mapping)
	let text_before_cursor = getline('.')[0 : col('.')-1]
	let mapping_pattern = '\V' . escape(a:mapping, '\')
	let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
	return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

" Re|Mappings
" ------------------------------------

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" <leader>t will call :Dispatch
"nnoremap <leader>t :Dispatch<CR>

" Reading and Writing Protected Files
cmap w!! w suda://%

" [\* ] Search and replace the word under the cursor.
map <Leader> * :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i

" [\xs] Clear search terms.
nnoremap <Leader>xs <Esc>:noh<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Insert a newline without going into insert mode
nmap <S-Return> O<Esc>
nmap <CR> o<Esc>

" Drag current line/s vertically and autoindent
nnoremap <Leader>k :m-2<CR>==
nnoremap <leader>j :m+<CR>==
vnoremap <Leader>k :m'<-2<CR>gv=gv
vnoremap <Leader>j :m'>+<CR>gv=gv

" Duplicate lines
nnoremap <Leader>d m`YP``
vnoremap <Leader>d YPgv

" Use Backspace for matching parens
nmap <BS> %
xmap <BS> %

" Easier search and replace in visual/select mode
xnoremap <C-r> :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>
function! s:get_selection(cmdtype) "{{{
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction

" Switch (window) to the directory of the current opened buffer
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" <Tab> to switch to next buffer, <Shift><Tab> to the previous one
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>

" Window navigation using <C-[h,j,k,l]>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Fast saving from all modes
nnoremap <Leader>w :write<CR>
xnoremap <Leader>w <Esc>:write<CR>
nnoremap <C-s> :<C-u>write<CR>
xnoremap <C-s> :<C-u>write<CR>
cnoremap <C-s> <C-u>write<CR>

" Open the macOS dictionary on current word
if has('mac')
	" Open the macOS dictionary on current word
	nmap <Leader>? :!open dict://<cword><CR>
endif

nnoremap <silent> <Leader>ml :call <SID>append_modeline()<CR>

" Append modeline after last line in buffer
" See: http://vim.wikia.com/wiki/Modeline_magic
function! s:append_modeline() "{{{
	let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d %set :',
				\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
	call append(line('$'), l:modeline)
endfunction "}}}

" Context-aware action-menu, neovim only (see plugin/actionmenu.vim)
if has('nvim')
	nmap <silent> <LocalLeader>c :<C-u>ActionMenu<CR>
endif
nmap <silent> <Leader>h
	\ :echo 'hi<'.synIDattr(synID(line('.'), col('.'), 1), 'name')
	\ . '> trans<'.synIDattr(synID(line('.'), col('.'), 0), 'name') . '> lo<'


" Smart wrap toggle (breakindent and colorcolumn toggle as-well)
nmap <Leader>tw :execute('setlocal wrap! breakindent! colorcolumn=' .
	\ (&colorcolumn == '' ? &textwidth : ''))<CR>

" Toggle editor's visual effects
nmap <Leader>ts :setlocal spell!<cr>
nmap <Leader>tn :setlocal nonumber!<CR>
nmap <Leader>tl :setlocal nolist!<CR>
nmap <Leader>th :nohlsearch<CR>

" [\vi] edit the config files
nnoremap <silent> <Leader>vi :tabnew <bar> :e $HOME/.config/nvim/init.vim<CR>

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

" Fix keybind name
map <Nul> <C-Space>
map! <Nul> <C-Space>

" Double leader for toggling visual-line mode
nmap <Leader><Leader> V
vmap <Leader><Leader> <Esc>


" Location/quickfix list movement
nmap ]l :lnext<CR>
nmap [l :lprev<CR>
nmap ]q :cnext<CR>
nmap [q :cprev<CR>

" Start newline from any cursor position in insert-mode
inoremap <S-Return> <C-o>o

" Use the language server functionality
noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

" Remap such that only yanked text get sent to the system clipboard.
"nnoremap c "cc
"vnoremap c "cc
"nnoremap C "cC
"vnoremap C "cC

nnoremap d "dd
vnoremap d "dd
nnoremap D "dD
vnoremap D "dD

"nnoremap x "xx
"vnoremap x "xx
"nnoremap X "xX
"vnoremap X "xX

" Map '||' and '__' to auto-enable table mode
inoreabbrev <expr> <bar><bar>
			\ <SID>isAtStartOfLine('\|\|') ?
			\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
			\ <SID>isAtStartOfLine('__') ?
			\ '<c-o>:silent! TableModeDisable<cr>' : '__'
