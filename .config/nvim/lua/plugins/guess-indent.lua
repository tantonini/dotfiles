local M = {
  "NMAC427/guess-indent.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = "GuessIndent",
}

M.config = function()
  require('guess-indent').setup()
end

return M
