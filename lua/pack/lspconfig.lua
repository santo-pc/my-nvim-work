local lazydev = require 'lazydev'
lazydev.setup {
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
}

-- nvim-lspconfig itself is configured in lsp/lsp-config.lua

-- vim: ts=2 sts=2 sw=2 et
