local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
}

M.config = function()
  require("ibl").setup {
    enabled = true,
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    }
  }
end

return M
