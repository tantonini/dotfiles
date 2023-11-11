local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = {"LspInfo", "LspLog", "LspRestart", "LspStart", "LspStop"}
}

M.config = function()
  local lspconfig = require('lspconfig')
  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    has_cmp and cmp_nvim_lsp.default_capabilities() or {}
  )

  local servers = { 'bashls', 'clangd', 'cmake', 'lua_ls', 'rust_analyzer' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities,
    }
  end

  lspconfig.lua_ls.setup {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          }
        })

        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      end
      return true
    end
  }

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
