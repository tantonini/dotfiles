local M = {
  "neovim/nvim-lspconfig"
}

M.config = function()
  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

  local servers = { 'bashls', 'clangd', 'cmake', 'lua_ls', 'pyright', 'rust_analyzer' }
  for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
  end

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend("force", {desc = "LSP: Go to declaration"}, opts))
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend("force", {desc = "LSP: Go to definition"}, opts))
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend("force", {desc = "LSP: Hover"}, opts))
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend("force", {desc = "LSP: Go to implementation"}, opts))
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend("force", {desc = "LSP: Signature help"}, opts))
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", {desc = "LSP: Add workspace folder"}, opts))
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", {desc = "LSP: Remove workspace folder"}, opts))
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, vim.tbl_extend("force", {desc = "LSP: List workspace folders"}, opts))
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, vim.tbl_extend("force", {desc = "LSP: Go to type definition"}, opts))
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, vim.tbl_extend("force", {desc = "LSP: Rename"}, opts))
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, vim.tbl_extend("force", {desc = "LSP: Code action"}, opts))
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend("force", {desc = "LSP: List references"}, opts))
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, vim.tbl_extend("force", {desc = "LSP: Format buffer"}, opts))
    end,
  })
end

return M
