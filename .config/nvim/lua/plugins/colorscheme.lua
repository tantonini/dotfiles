return {
  {
    "EdenEast/nightfox.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nordfox]])
    end,
  },
  { "rebelot/kanagawa.nvim", lazy = true},
  {
    "catppuccin/nvim",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
      })
      vim.cmd([[colorscheme catppuccin]])
    end
  }
}
