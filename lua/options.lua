-- [[ Display ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.colorcolumn = '80'
vim.opt.textwidth = 80
vim.g.have_nerd_font = true

-- [[ Editing ]]
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.scrolloff = 10
vim.opt.inccommand = 'split'
vim.opt.confirm = true
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- [[ Search ]]
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- [[ Windows ]]
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.winwidth = 50

-- [[ Performance ]]
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.undofile = true

-- [[ System ]]
vim.o.shell = '/run/current-system/sw/bin/bash'
require('vim._core.ui2').enable {}
