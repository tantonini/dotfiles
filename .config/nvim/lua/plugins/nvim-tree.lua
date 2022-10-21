vim.api.nvim_command([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
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
      icons = {
        corner = "└",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  git = {
    enable = false,
  },
}
