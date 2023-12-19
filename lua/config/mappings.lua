local M = {}

vim.cmd([[
  let s:guifontsize = 16
  let s:guifont = "Iosevka\\ Comfy"

  function! AdjustFontSize(amount)
    let s:guifontsize = s:guifontsize+a:amount
    exe "set guifont=" .. s:guifont .. ":h" .. s:guifontsize
  endfunction
]])

function M.setup()
  vim.g.leader = ' '
  vim.g.mapleader = ' '

  local keymap, fn, api = vim.keymap, vim.fn, vim.api
  keymap.set('n', '<Up>', '<Nop>')
  keymap.set('n', '<Left>', '<Nop>')
  keymap.set('n', '<Right>', '<Nop>')
  keymap.set('n', '<Down>', '<Nop>')

  keymap.set('x', '<Up>', '<Nop>')
  keymap.set('x', '<Left>', '<Nop>')
  keymap.set('x', '<Right>', '<Nop>')
  keymap.set('x', '<Down>', '<Nop>')

  keymap.set('i', '<Up>', '<Nop>')
  keymap.set('i', '<Left>', '<Nop>')
  keymap.set('i', '<Right>', '<Nop>')
  keymap.set('i', '<Down>', '<Nop>')

  keymap.set('i', '<C-Left>', '<Nop>')
  keymap.set('i', '<C-Right>', '<Nop>')

  keymap.set('n', '<C-Left>', '<Nop>')
  keymap.set('n', '<C-Right>', '<Nop>')

  keymap.set('x', '<C-Left>', '<Nop>')
  keymap.set('x', '<C-Right>', '<Nop>')

  api.nvim_set_keymap('n', '<C-s>', '<CMD>w<CR>', {})
  api.nvim_set_keymap('i', '<C-s>', '<CMD>w<CR>', {})

  api.nvim_set_keymap('n', '<leader>q', '<CMD>wq<CR>', {})
  api.nvim_set_keymap('n', '<C-q>', '<CMD>q!<CR>', {})

  api.nvim_set_keymap('n', '<C-n>', '<CMD>bn<CR>', { silent = true })
  api.nvim_set_keymap('n', '<C-p>', '<CMD>bp<CR>', { silent = true })

  api.nvim_set_keymap('n', '<leader>e', '<CMD>Vex<CR>', {})
  api.nvim_set_keymap('n', '<C-=>', ':call AdjustFontSize(1)<CR>', { silent = true })
  api.nvim_set_keymap('n', '<C-->', ':call AdjustFontSize(-1)<CR>', { silent = true })
end

return M
