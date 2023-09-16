local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.opt.listchars:append "trail:⋅"
vim.opt.listchars:append "lead: "
vim.opt.listchars:append "tab:>—"

indent_blankline.setup {
    show_current_context = true,
		show_trailing_blankline_indent = false,
}
