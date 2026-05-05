local ibl = require 'ibl'
ibl.setup {
  indent = {
    char = '│',
    tab_char = '│',
  },
  scope = { show_start = false, show_end = false },
  exclude = {
    filetypes = {
      'Trouble',
      'alpha',
      'dashboard',
      'help',
      'lazy',
      'mason',
      'neo-tree',
      'notify',
      'snacks_dashboard',
      'snacks_notif',
      'snacks_terminal',
      'snacks_win',
      'toggleterm',
      'trouble',
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
