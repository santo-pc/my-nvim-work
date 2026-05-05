local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    hidden = true,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    mappings = {
      i = { ['<esc>'] = actions.close },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}

pcall(telescope.load_extension, 'fzf')
pcall(telescope.load_extension, 'ui-select')

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = '[S] Find files' })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = '[S]earch Live [G]rep' })
vim.keymap.set('n', '<leader>lq', builtin.quickfix, { desc = '[ ] Quickfix List' })
vim.keymap.set('n', '<leader>lj', builtin.jumplist, { desc = '[ ] Jumplist' })
vim.keymap.set('n', '<leader>st', builtin.colorscheme, { desc = '[S]earch [T]heme' })

vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-- vim: ts=2 sts=2 sw=2 et
