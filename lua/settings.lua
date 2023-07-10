vim.g.mapleader = ','

vim.opt.number = true
vim.opt.mouse = 'a'
vim.api.nvim_set_option("clipboard","unnamed")
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.showtabline = 1

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("tnoremap <Esc> <C-\\><C-n>")
vim.cmd("autocmd TermOpen * startinsert")