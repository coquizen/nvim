set encoding=utf-8                                 " Use UTF-8 without BOM
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
