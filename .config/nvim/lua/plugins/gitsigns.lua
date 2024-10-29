local M = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  keys = {
    { "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Gitsigns blame" },
  },
  cmd = "Gitsigns",
}

M.config = function()
  require('gitsigns').setup()
end

return M

-- My config
-- signs = {
--   add          = { text = '+' },
--   change       = { text = '~' },
--   delete       = { text = '-' },
--   topdelete    = { text = '-' },
--   changedelete = { text = '~' },
--   untracked    = { text = '┆' },
-- }
