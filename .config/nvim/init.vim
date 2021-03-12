" vim:fdm=marker

" Vim-plug {{{
" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'arcticicestudio/nord-vim'

" Initialize plugin system
call plug#end()
" }}}

" Style {{{
set termguicolors	" Needed for having true colors (24-bit colors)
colorscheme nord
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show invisible characters.
" }}}

" General {{{
set number              " Set line number
set autoindent          " Enable auto indent
set smartindent         " Indent after {, remove when starting with #, etc...
set noswapfile
set tabstop=4           " Insert 4 spaces for a tab
set shiftwidth=4        " Change the number of space characters inserted for indentation
set smarttab
set expandtab           " Converts tabs to spaces
" }}}

" Mouse {{{
set mouse=nv
" }}}

" Keyboard shortcuts {{{
" }}}

" Leaders {{{
" }}}

" Plugins {{{
" }}}
