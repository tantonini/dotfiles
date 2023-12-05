local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
}

M.config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "all",
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },
    }
end

return M
