local autoformat = require 'autoformat'
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Source config. Only makes sense when editing Neovim: Consider removing
vim.keymap.set('n', '<leader>.', ':update<CR> :source<CR> :echo "sourced config!"<CR>', { desc = 'Source current file in neovim' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>qq', '<cmd>qa<CR>', { noremap = true, silent = true, desc = 'Quit All' })

vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'Switch Windows' })
vim.keymap.set('n', '<C-left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffers
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
vim.keymap.set('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
vim.keymap.set('n', '<leader>pp', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>nn', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>p', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>n', '<cmd>bnext<cr>', { desc = 'Next Buffer' })

-- Jump back and Next
vim.keymap.set('n', '<leader>gn', '<C-i>', { desc = '[N]av Next Jump' })
vim.keymap.set('n', '<leader>gb', '<C-o>', { desc = '[N]av Prev Jump' })

-- Yank Post
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Json Beautify wit jq
vim.keymap.set('n', '<leader>fj', ':%!jq <CR>', { noremap = true, silent = true, desc = '[F]ormat Json Beautify' })
vim.keymap.set('n', '<leader>fc', ':%!jq -c <CR>', { noremap = true, silent = true, desc = '[F]ormat Json Uglyfy' })

-- Diagnostics
vim.keymap.set('n', '<leader>xd', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line [D]iagnostics' })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

vim.keymap.set('n', ']d', diagnostic_goto(true), { desc = 'Next [D]iagnostic' })
vim.keymap.set('n', '[d', diagnostic_goto(false), { desc = 'Prev [D]iagnostic' })
vim.keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error [D]iagnostic' })
vim.keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error [D]iagnostic' })
vim.keymap.set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning [D]iagnostic' })
vim.keymap.set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning [D]iagnostic' })

-- location list
vim.keymap.set('n', '<leader>xl', function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = 'Location List' })
-- quickfix list
vim.keymap.set('n', '<leader>xq', function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = 'Quickfix List' })

-- quickfix navigation
local function jump_quickfix(direction)
  local qflist = vim.fn.getqflist { idx = 0, size = 0 }
  local idx, size = qflist.idx, qflist.size
  if direction == 'next' then
    if idx >= size then
      vim.cmd 'cfirst'
      vim.notify('Wrapped to first quickfix item', vim.log.levels.INFO)
    else
      vim.cmd 'cnext'
    end
  elseif direction == 'prev' then
    if idx <= 1 then
      vim.cmd 'clast'
      vim.notify('Wrapped to last quickfix item', vim.log.levels.INFO)
    else
      vim.cmd 'cprev'
    end
  end
end

vim.keymap.set('n', ']q', function()
  jump_quickfix 'next'
end, { desc = 'Jump next in quixkfix list' })
vim.keymap.set('n', '[q', function()
  jump_quickfix 'prev'
end, { desc = 'Jump prev in quixkfix list' })

vim.keymap.set('n', '<leader>tf', function()
  local buf = vim.api.nvim_get_current_buf()
  -- nil is enable thus we disable the first time
  if vim.b[buf].autoformat == nil then
    vim.b[buf].autoformat = false
  else
    vim.b[buf].autoformat = not vim.b[buf].autoformat
  end
  print('Buffer autoformat:', autoformat.status())
end, { desc = '[T]oggle autoformat for current buffer' })

vim.keymap.set('n', '<leader>tF', function()
  if vim.g.autoformat == nil then
    vim.g.autoformat = false
  else
    vim.g.autoformat = not vim.g.autoformat
  end
  print('Global autoformat:', autoformat.status())
end, { desc = '[T]oggle autoformat globally' })

vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<cr>', { desc = 'Split Window Vertical' })
vim.keymap.set('n', '<leader>sp', '<cmd>split<cr>', { desc = 'Split Window Horizontal' })

-- vim: ts=2 sts=2 sw=2 et
