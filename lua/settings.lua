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
vim.opt.colorcolumn = "100"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.laststatus = 3

vim.opt.termguicolors = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("tnoremap <Esc> <C-\\><C-n>")
vim.cmd("autocmd TermOpen * startinsert")

-- https://dev.to/minodisk/automatically-switch-to-insert-mode-when-focusing-on-terminal-window-in-vim8-9ab
vim.cmd("autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif")

vim.cmd([[
augroup kitty_mp
    autocmd!
    au VimLeave * if !empty($KITTY_WINDOW_ID) | :silent !kitty @ set-spacing padding=20 margin=0
    au VimEnter * if !empty($KITTY_WINDOW_ID) | :silent !kitty @ set-spacing padding=0 margin=0
    au BufEnter * if !empty($KITTY_WINDOW_ID) | :silent !kitty @ set-spacing padding=0 margin=0
augroup END
]])
