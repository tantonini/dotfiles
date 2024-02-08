local M = {
  'tantonini/toggleterm.nvim',
  cmd = {
    "ToggleTerm",
    "ToggleTermToggleAll",
    "TermSelect",
    "ToggleTermSetName",
  },
  keys = {
    { [[<c-t>]], desc = "Toggle Terminal" },
  --  { [[<c-t>]], '<cmd>execute tabpagenr() . "ToggleTerm"<cr>', desc = "Toggle Terminal" },
  --  { [[<c-t>]], '<cmd>execute tabpagenr() . "ToggleTerm"<cr>', mode = "t", desc = "Toggle Terminal" },
  --  { [[<c-t>]], '<cmd>execute tabpagenr() . "ToggleTerm"<cr>', mode = "i", desc = "Toggle Terminal" },
  }
}

M.config = function()
  require('toggleterm').setup {
    open_mapping = [[<c-t>]],
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    autochdir = true,
  }
end

return M
