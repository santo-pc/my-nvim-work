vim.pack.add {
  -- Core dependencies
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },

  -- LSP
  { src = 'https://github.com/folke/lazydev.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/saghen/blink.lib' },
  { src = 'https://github.com/saghen/blink.cmp' },

  -- Completion
  { src = 'https://github.com/hrsh7th/nvim-cmp' },
  { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
  { src = 'https://github.com/hrsh7th/cmp-path' },
  { src = 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help' },
  { src = 'https://github.com/saadparwaiz1/cmp_luasnip' },
  { src = 'https://github.com/L3MON4D3/LuaSnip',                         build = 'make install_jsregexp' },

  -- Telescope
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },

  -- Oil
  { src = 'https://github.com/stevearc/oil.nvim' },

  -- Treesitter
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },

  -- -- File tree
  -- { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },

  -- Git
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },

  -- Undotree
  { src = 'https://github.com/mbbill/undotree' },

  -- Formatting & linting
  { src = 'https://github.com/stevearc/conform.nvim' },
  { src = 'https://github.com/mfussenegger/nvim-lint' },

  -- Detect tabstop and shiftwidth automatically
  { src = 'https://github.com/tpope/vim-sleuth' },

  -- Debugging
  { src = 'https://github.com/mfussenegger/nvim-dap' },
  { src = 'https://github.com/rcarriga/nvim-dap-ui' },
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
  { src = 'https://github.com/leoluz/nvim-dap-go' },

  -- Rust
  { src = 'https://github.com/mrcjkb/rustaceanvim' },

  -- UI
  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/sschleemilch/slimline.nvim' },
  { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
  { src = 'https://github.com/folke/todo-comments.nvim' },
  { src = 'https://github.com/rose-pine/neovim' },

  -- Mini modules
  { src = 'https://github.com/echasnovski/mini.nvim' },
  { src = 'https://github.com/echasnovski/mini.indentscope' },

  -- Colorschemes
  { src = 'https://github.com/datsfilipe/vesper.nvim' },
  { src = 'https://github.com/folke/tokyonight.nvim' },
  { src = 'https://github.com/rose-pine/neovim' },

  -- Pairs
  { src = 'https://github.com/windwp/nvim-autopairs' },
}

-- vim: ts=2 sts=2 sw=2 et
