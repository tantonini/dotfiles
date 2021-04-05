vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'arcticicestudio/nord-vim'
  use 'hrsh7th/nvim-compe'
  use 'itchyny/lightline.vim'
  use 'preservim/nerdtree'
end)
