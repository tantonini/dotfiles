local M = {
  "tpope/vim-fugitive",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = "Git",
}

return M
