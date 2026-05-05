-- Colorscheme first so the UI is correct before other plugins draw anything
require 'pack.colorscheme'

-- UI chrome (statusline, indent guides, keybind hints)
require 'pack.which-key'
require 'pack.slimline'
require 'pack.indent-blankline'
require 'pack.mini-indentscope'
require 'pack.todo-comments'

-- Core editing (mini textobjects/surround, pairs)
require 'pack.mini'
require 'pack.autopairs'

-- Fuzzy finding
require 'pack.telescope'

-- Syntax treesitter
require 'pack.treesitter'

-- File tree
require 'pack.oil'

-- Git
require 'pack.gitsigns'

-- LSP support libs (lazydev before lspconfig)
require 'pack.lspconfig'

-- Completion (luasnip → cmp → autopairs integration)
require 'pack.cmp'

-- Formatting & linting
require 'pack.conform'
require 'pack.lint'

-- Debugging
require 'pack.debug'

-- Rust
require 'pack.rustaceanvim'

-- vim: ts=2 sts=2 sw=2 et
