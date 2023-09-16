return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nordfox]])
    end,
  },
  { "folke/tokyonight.nvim", lazy = true},
  { "navarasu/onedark.nvim", lazy = true},
  { "marko-cerovac/material.nvim", lazy = true},
  { "rebelot/kanagawa.nvim", lazy = true},
  { "rmehri01/onenord.nvim", lazy = true},
  { "shaunsingh/nord.nvim", lazy = true},
}
