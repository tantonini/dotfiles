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
  backup = false,                          -- creates a backup file
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = {
    "menuone",
    "preview",
    "noselect" },                          -- options for Insert mode completion
  conceallevel = 0,                        -- so that `` is visible in markdown files
  -- cursorline = true,                       -- highlight the current line
  expandtab = true,                        -- convert tabs to spaces
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  list = true,                             -- show invisible characters
  mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  -- numberwidth = 4,                         -- set number column width to 2 {default 4}
  pumheight = 10,                          -- pop up menu height
  relativenumber = false,                  -- set relative numbered lines
  --scrolloff = 8,                           -- is one of my fav
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  -- showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  -- showtabline = 2,                         -- always show tabs
  --sidescrolloff = 8,
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  -- splitbelow = true,                       -- force all horizontal splits to go below current window
  -- splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  tabstop = 4,                             -- insert 2 spaces for a tab
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  -- timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  -- wrap = false,                            -- display lines as one long line
  -- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  tabline = "%!MyTabLine()",
  wildmode = "longest:full"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
