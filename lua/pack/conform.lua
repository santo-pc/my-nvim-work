local autoformat = require 'autoformat'
local conform = require 'conform'

conform.setup {
  notify_on_error = true,
  format_on_save = function(bufnr)
    if not autoformat.should_format(bufnr) then
      return
    end

    local disable_filetypes = { c = true, cpp = true }
    local lsp_format_opt = disable_filetypes[vim.bo[bufnr].filetype] and 'never' or 'fallback'

    return {
      timeout_ms = 500,
      lsp_format = lsp_format_opt,
    }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    rust = { 'rustfmt' },
    nix = { 'nixfmt' },
    elixir = { 'mix' },
    go = { 'gofmt' },
  },
}

vim.keymap.set('', '<leader>ff', function()
  conform.format { async = true, lsp_format = 'fallback' }
  print 'Buffer formatted!'
end, { desc = '[F]ormat buffer' })

-- vim: ts=2 sts=2 sw=2 et
