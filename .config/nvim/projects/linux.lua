local linux_coding_style = function()
  vim.opt_local.colorcolumn = "80"
  vim.opt_local.tabstop = 8
  vim.opt_local.shiftwidth = 8
  vim.opt_local.softtabstop = 8
  vim.opt_local.textwidth = 80
  vim.opt_local.expandtab = false

  vim.opt_local.cindent = true
  vim.opt_local.cinoptions = ":0,l1,t0,g0,(0"
end

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.cpp", "*.h"},
  callback = linux_coding_style,
  group = "projectconfig",
})
