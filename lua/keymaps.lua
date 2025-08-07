-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Source config. Only makes sense when editing Neovim: Consider removing
vim.keymap.set('n', '<leader>.', ':update<CR> :source<CR> :echo "sourced config!"<CR>',
  { desc = 'Source current file in neovim' })

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

-- Jump back and Next
vim.keymap.set('n', 'gn', '<C-i>', { desc = 'Go Next Jump' })
vim.keymap.set('n', 'gN', '<C-o>', { desc = 'Go Prev Jump' })

-- Yank Post
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Json Beautify wit jq
vim.keymap.set('n', '<leader>jj', ':%!jq <CR>', { noremap = true, silent = true, desc = 'Beautify json' })
vim.keymap.set('n', '<leader>jc', ':%!jq -c <CR>', { noremap = true, silent = true, desc = 'Uglyfy json' })

-- Diagnostics
vim.keymap.set('n', '<leader>xd', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

vim.keymap.set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
vim.keymap.set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
vim.keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
vim.keymap.set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
vim.keymap.set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

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

-- vim: ts=2 sts=2 sw=2 et
