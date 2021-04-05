vim.cmd('set noshowmode')

vim.g.lightline = {
  colorscheme = 'nord',
  active = {
    left = {
      {'mode', 'paste'},
      {'readonly', 'relativepath', 'modified'}
    },
    right = {
      {'lineinfo'},
      {'percent'},
      {'fileformat', 'fileencoding', 'filetype'}
    },
  },
  inactive = {
    left = {
      {'relativepath'},
      {'modified'}
    },
    right = {
      {'lineinfo'},
      {'percent'}
    }
  },
  tabline = {
    left = {
        {'tabs'}
    },
    right = {
      {'close'}
    }
  },
  tab = {
    active = {'tabnum', 'cwd', 'filename', 'modified'},
    inactive = {'tabnum', 'cwd', 'filename', 'modified'},
  },
  tab_component_function = {
    cwd = 'LightlineCurrentDirectory'
  },
}

vim.cmd([[
function! LightlineCurrentDirectory(n) abort
  return fnamemodify(getcwd(tabpagewinnr(a:n), a:n), ':t')
endfunction
]])
