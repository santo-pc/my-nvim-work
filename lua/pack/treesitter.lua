local ensureInstalled = {
  'go',
  'elixir',
  'heex',
  'eex',
  'bash',
  'c',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'vim',
  'vimdoc',
  'nix',
  'java',
}

require('nvim-treesitter').install {
  unpack(ensureInstalled),
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = unpack(ensureInstalled),
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
