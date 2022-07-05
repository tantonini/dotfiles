" Having a .vimrc ignores the default vim configuration, These lines permit to
" prepend our .vimrc by the default vim configuration
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

if !empty(glob('~/.vim/autoload/plug.vim'))
    call plug#begin()
        Plug 'arcticicestudio/nord-vim'
    call plug#end()
endif

set expandtab                           " Convert tabs to spaces
set list                                " Show invisible characters
set listchars=tab:>\ ,trail:-,nbsp:+    " Invisible characters
set mouse=a                             " Enable mouse in all modes
set nobackup nowritebackup              " Do not write backup files
set noignorecase                        " Case sensitive search
set noswapfile                          " Do not write swap files
set number                              " Show line number
set tabstop=4                           " 4 spaces for tab
set termguicolors                       " Enable 24-bit RGB color in TUI
set undofile                            " Enable persistant undo
set wildmode=longest:full               " Command completion like bash
set wildoptions=pum                     " Command completion with popupmenu

try
    colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry
