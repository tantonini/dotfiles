local M = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
  }
}

M.config = function()
  require("nvim-tree").setup {
    update_focused_file = {
      enable = true
    },
    hijack_cursor = true,
    update_cwd = true,
    view = {
      signcolumn = "no",
    },
    renderer = {
      add_trailing = true,
      highlight_opened_files = "all",
      indent_markers = {
        enable = true,
      },
    },
    git = {
      enable = false,
    }
  }
end

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

return M
