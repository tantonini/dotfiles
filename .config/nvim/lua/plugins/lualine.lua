local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  }
}

M.config = function()
  require('lualine').setup {
    options = {
      component_separators = { left = '|', right = '|'},
      section_separators = { left = '', right = ''},
    }
  }
end

return M
