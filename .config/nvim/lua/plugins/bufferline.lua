local M = {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  }
}

M.config = function()
  require('bufferline').setup {
    options = {
      mode = "tabs",
    }
  }
end

return M
