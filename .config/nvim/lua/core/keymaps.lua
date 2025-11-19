local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- To use ALT+{h,j,k,l} or ALT+{Up, Down, Left, Right} to navigate windows from any mode
vim.keymap.set({'i', 't'}, '<A-h>', [[<C-\><C-N><C-w>h]])
vim.keymap.set({'i', 't'}, '<A-j>', [[<C-\><C-N><C-w>j]])
vim.keymap.set({'i', 't'}, '<A-k>', [[<C-\><C-N><C-w>k]])
vim.keymap.set({'i', 't'}, '<A-l>', [[<C-\><C-N><C-w>l]])
vim.keymap.set({'i', 't'}, '<A-Left>', [[<C-\><C-N><C-w>h]])
vim.keymap.set({'i', 't'}, '<A-Down>', [[<C-\><C-N><C-w>j]])
vim.keymap.set({'i', 't'}, '<A-Up>', [[<C-\><C-N><C-w>k]])
vim.keymap.set({'i', 't'}, '<A-Right>', [[<C-\><C-N><C-w>l]])

vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-Left>', '<C-w>h')
vim.keymap.set('n', '<A-Down>', '<C-w>j')
vim.keymap.set('n', '<A-Up>', '<C-w>k')
vim.keymap.set('n', '<A-Right>', '<C-w>l')

--- Map <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
