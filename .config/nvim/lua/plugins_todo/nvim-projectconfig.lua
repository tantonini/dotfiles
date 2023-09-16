local status_ok, project_config = pcall(require, "nvim-projectconfig")
if not status_ok then
  return
end

local projectconfig_grp = vim.api.nvim_create_augroup("projectconfig", { clear = true })

project_config.setup()

-- Clear and reload project config on each tab change to avoid config
-- applied to another project
local clear_projectconfig_cb = function()
  vim.api.nvim_clear_autocmds({ group = projectconfig_grp })
end

vim.api.nvim_create_autocmd("TabLeave", {
  callback = clear_projectconfig_cb,
})
