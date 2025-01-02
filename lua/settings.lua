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
vim.opt.cursorline = true
vim.opt.guicursor = "n-v-c-sm:hor25,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.conceallevel = 2

-- 关闭 codeverse 内置自动补全
vim.g.codeverse_disable_autocompletion = false
-- 关闭 codeverse 内置 tab 映射
vim.g.codeverse_no_map_tab = false
-- 关闭 codeverse 内置补全映射
vim.g.codeverse_disable_bindings = false

-- 设置 swap 文件目录
vim.opt.directory = os.getenv("HOME") .. "/.local/share/nvim/swap"

vim.opt.termguicolors = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("tnoremap <Esc> <C-\\><C-n>")
vim.cmd("autocmd TermOpen * startinsert")

-- https://dev.to/minodisk/automatically-switch-to-insert-mode-when-focusing-on-terminal-window-in-vim8-9ab
vim.cmd("autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif")

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
