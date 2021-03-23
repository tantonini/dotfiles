" vim:fdm=marker

" Vim-plug {{{
" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'   " For git diff preview in sign column
Plug 'arcticicestudio/nord-vim'
Plug 'caenrique/nvim-toggle-terminal'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-fugitive'       " For :Gblame, etc...

" Initialize plugin system
call plug#end()
" }}}

" Style {{{
set termguicolors       " Needed for having true colors (24-bit colors)
let g:nord_italic=1
let g:nord_italic_comments=1
let g:nord_underline=1
colorscheme nord
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show invisible characters.
set signcolumn=yes      " Always show the signcolumn for avoiding shifting the window each time
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
set updatetime=100
" }}}

" Mouse {{{
set mouse=nv
" }}}

" Keyboard shortcuts {{{
" NERDTree {{{
nnoremap <C-t> :NERDTreeToggle<CR>
" }}}
" }}}

" Leaders {{{
let g:mapleader = "\<Space>"
" fzf {{{
nnoremap <silent> <leader>f :Files<CR>
" }}}
" NERDTree {{{
nnoremap <leader>n :NERDTreeToggle<CR>
" }}}
" vimspector {{{
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
" }}}
" }}}

" Plugins {{{
" Coc nvim {{{
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}
" NERDTree {{{
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" }}}
" nvim toggle {{{
nnoremap <silent> <C-z> :ToggleTabTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTabTerminal<Enter>
let g:auto_start_insert=1
" }}}
" vimspector {{{
let g:vimspector_enable_mappings = 'HUMAN'
" }}}
" }}}
