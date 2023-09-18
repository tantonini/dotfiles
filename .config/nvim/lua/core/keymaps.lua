local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Toggleterm
-- Use a different terminal per tab
keymap("n", "<c-t>", "<cmd>exe tabpagenr() . 'ToggleTerm'<cr>", opts)
keymap("i", "<c-t>", "<cmd>exe tabpagenr() . 'ToggleTerm'<cr>", opts)
keymap("t", "<c-t>", "<cmd>exe tabpagenr() . 'ToggleTerm'<cr>", opts)
