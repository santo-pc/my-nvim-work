-- LSP Plugins
return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- Installs the LspInfo function
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
