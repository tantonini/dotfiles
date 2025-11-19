local M = {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Grep" },
  },
  cmd = "Telescope",
}

M.config = function()
  require("telescope").setup({
    defaults = {
      preview = {
        treesitter = false,
      },
    },
  })
end

return M
