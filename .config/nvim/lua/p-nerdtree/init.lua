vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
-- vim.cmd("autocmd StdinReadPre * let s:std_in=1")
-- vim.cmd("autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif")

-- Exit Vim if NERDTree is the only window left.
vim.cmd("autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")
