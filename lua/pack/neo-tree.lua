local neotree = require 'neo-tree'

neotree.setup {
  sources = { 'filesystem', 'buffers', 'git_status' },
  filesystem = {
    bind_to_cwd = true,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
    window = {
      mappings = {
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['<space>'] = 'none',
        ['Y'] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg('+', path, 'c')
          end,
          desc = 'Copy Path to Clipboard',
        },
        ['O'] = {
          function(state)
            vim.ui.open(state.tree:get_node().path)
          end,
          desc = 'Open with System Application',
        },
        ['P'] = { 'toggle_preview', config = { use_float = false } },
      },
    },
    filtered_items = {
      visible = true,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_by_name = {},
      never_show = {},
    },
  },
}

-- neotree.execute { action = 'close' }
neotree.close_all()

vim.keymap.set('n', '<leader>e', function()
  local root = vim.fs.root(0, { '.git', 'package.json', 'Cargo.toml' }) or vim.fn.getcwd()
  require('neo-tree.command').execute { toggle = true, dir = root }
end, { desc = 'Explorer NeoTree (Root Dir)' })

-- vim: ts=2 sts=2 sw=2 et
