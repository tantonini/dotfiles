local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Toggleterm
-- Use a different terminal per tab
keymap("n", "<c-t>", "<cmd>exe tabpagenr() . 'ToggleTerm'<cr>", opts)
keymap("i", "<c-t>", "<cmd>exe tabpagenr() . 'ToggleTerm'<cr>", opts)
keymap("t", "<c-t>", "<cmd>exe tabpagenr() . 'ToggleTerm'<cr>", opts)
