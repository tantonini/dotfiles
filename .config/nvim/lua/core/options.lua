-- For nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_command([[
    function MyTabLabel(n)
      return substitute(getcwd(-1, a:n),$HOME,'~','')
	endfunction

	function MyTabLine()
	  let s = ''
	  for i in range(tabpagenr('$'))
	    " select the highlighting
	    if i + 1 == tabpagenr()
	      let s ..= '%#TabLineSel#'
	    else
	      let s ..= '%#TabLine#'
	    endif

	    " set the tab page number (for mouse clicks)
	    let s ..= '%' .. (i + 1) .. 'T'

	    " the label is made by MyTabLabel()
	    let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
	  endfor

	  " after the last tab fill with TabLineFill and reset tab page nr
	  let s ..= '%#TabLineFill#%T'

	  " right-align the label to close the current tab page
	  if tabpagenr('$') > 1
	    let s ..= '%=%#TabLine#%999XX'
	  endif

	  return s
	endfunction
]])

local options = {
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = {
    "menuone",
    "preview",
    "noselect" },                          -- options for Insert mode completion
  list = true,                             -- show invisible characters
  mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  pumheight = 10,                          -- pop up menu height
  signcolumn = "yes:2",                    -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  title = true,                            -- set window title
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  tabline = "%!MyTabLine()",
  wildmode = "longest:full"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.listchars:append "trail:⋅"
vim.opt.listchars:append "lead: "
vim.opt.listchars:append "tab:>—"

vim.cmd.aunmenu{'PopUp.How-to\\ disable\\ mouse'}
vim.cmd.aunmenu{'PopUp.-1-' }
