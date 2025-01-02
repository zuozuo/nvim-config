-- 以 iterm 开头的注释说明的是配合 iterm2 的快捷键映射 keymap-for-vim.itermkeymap 在 iterm2 里面使用 nvim 的快捷键映射
-- cmd-e 搜索文件
-- cmd-d 在 buffers 里面搜索文件
-- ,w    project搜索当前光标下的word
-- cmd-f project搜索 live_grep
-- cmd-s-o project 搜索 tag
-- cmd-s-y file 搜索 tag
-- cmd-s-l 显示文件的 symbol 列表
-- bb :BufferGoto
-- cmd-s-g lazygit
-- cmd-left FloatermPrev
-- cmd-right FloatermNext
-- space-space open split terminal
-- cmd-s-b open ipython
-- cmd-s save file
-- cmd-i goto definition
-- cmd-s-i goto definition split
-- cmd-s-v goto definition vsplit
-- cmd-[ goto previous buffer 
-- cmd-] goto next buffer
-- cc comment current line
-- ,n open file tree
-- ,d show telescope diagnostic
-- cmd-0 toggle avant

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<D-s-g>', '<CMD>FloatermNew --width=0.9 --height=0.8 lazygit<CR>', { desc = 'cmd-s-g' })

vim.keymap.set('n', '<F8>', '<CMD>FloatermPrev<CR>', { desc = 'cmd-left' })
vim.keymap.set('t', '<F8>', '<C-\\><C-n><CMD>FloatermPrev<CR>', { desc = 'cmd-left' })
vim.keymap.set('n', '<F9>', '<CMD>FloatermToggle<CR>')
vim.keymap.set('t', '<F9>', '<C-\\><C-n><CMD>FloatermToggle<CR>')
vim.keymap.set('t', '<F10>', '<C-\\><C-n><CMD>FloatermNext<CR>', { desc = 'cmd-right' })
vim.keymap.set('n', '<F10>', '<CMD>FloatermNext<CR>', { desc = 'cmd-right' })

vim.keymap.set('n', '<D-s-p>', "<cmd>Telescope<cr>", { desc = 'cmd-s-p' })
vim.keymap.set('v', '<D-s-p>', "<cmd>Telescope<cr>", { desc = 'cmd-s-p' })
vim.keymap.set('n', '<D-s-b>', '<cmd>FloatermNew --name=ipython --wintype=vsplit --width=0.5 ipython<CR>', { desc = 'cmd-s-b' })
vim.keymap.set('v', '<D-s-b>', "<cmd>'<,'>FloatermNew --name=ipython --wintype=vsplit --width=0.5 ipython<CR>", { desc = 'cmd-s-b' })

vim.keymap.set('t', '<D-b>', '<C-\\><C-n><CMD>Terminal<CR>', { desc = 'cmd-b' })
vim.keymap.set('n', '<D-b>', '<C-\\><C-n><cmd>Terminal<CR>', { desc = 'cmd-b' })
map('n', '<D-0>', '<C-\\><C-n><Cmd>FloatermToggle<CR>', opts)
map('t', '<D-0>', '<C-\\><C-n><Cmd>FloatermToggle<CR>', opts)
map('v', '<D-0>', '<C-\\><C-n><Cmd>FloatermToggle<CR>', opts)
map('i', '<D-0>', '<C-\\><C-n><Cmd>FloatermToggle<CR>', opts)

vim.keymap.set('n', '<c-n>', '<cmd>GotoCurrentPath<CR>')
vim.keymap.set('n', '<D-y>', '<cmd>Y<CR>')

map('n', '<C-9>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-2>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-1>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-0>', '<Cmd>BufferNext<CR>', opts)

map('n', 'L', '<Cmd>Lspsaga', opts)

map('n', '<space><space>', '<C-\\><C-n><Cmd>AvanteAsk explain in Chinese<CR>', opts)

-- map('n', '<leader>rr', '<Cmd>Telescope resume<CR>',
--   { noremap = true, silent = true, desc = 'Resume last telescope picker' })

map('n', '<D-e>', '<Cmd>Telescope find_files theme=dropdown<CR>', { noremap = true, silent = true, desc = 'cmd-e' })
map('n', '<D-d>', '<Cmd>Telescope buffers theme=dropdown<CR>', { noremap = true, silent = true, desc = 'List buffers' })
map('n', '<D-f>', '<Cmd>Telescope live_grep theme=dropdown<CR>', { noremap = true, silent = true, desc = 'cmd-f' })

-- Search current word in projecr files
map('n', '<leader>w', '<Cmd>Telescope grep_string theme=dropdown<CR>', { noremap = true, silent = true, desc = 'Grep current word' })

-- Search tags in current buffer (requires .tags file)
map('n', '<D-s-y>', '<Cmd>Telescope current_buffer_tags theme=dropdown ctags_file=.tags<CR>', { noremap = true, silent = true, desc = 'cmd-s-y' })

-- Search tags in project (requires .tags file)
map('n', '<D-s-o>', '<Cmd>Telescope tags theme=dropdown ctags_file=.tags<CR>', { noremap = true, silent = true, desc = 'cmd-s-o' })
map('n', '<leader>d', '<Cmd>Telescope diagnostics theme=dropdown<CR>', { noremap = true, silent = true, desc = 'Show diagnostics' })
map('n', '<D-s-r>', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true, desc = 'cmd-s-r' })
map('n', '<D-i>', '<cmd>Telescope lsp_definitions<CR>', { noremap = true, silent = true, desc = 'cmd-i' })
map('n', '<D-s-i>', '<cmd>sp | Telescope lsp_definitions<CR>', { noremap = true, silent = true, desc = 'cmd-s-i' })
map('n', '<D-s-v>', '<cmd>vsp | Telescope lsp_definitions<CR>', { noremap = true, silent = true, desc = 'cmd-s-v' })

map('n', '<D-s>', '<Cmd>w<CR>', { noremap = true, silent = true, desc = 'cmd-s' })

map('n', '<C-o>', '<cmd>edit #<CR>', opts)
map('n', '<D-o>', '<cmd>edit #<CR>', opts)
map('n', '<D-[>', '<cmd>bprev<CR>', opts)
map('n', '<D-]>', '<cmd>bnext<CR>', { noremap = true, silent = true, desc = 'cmd-s-p' })

-- vim.keymap.set('n', '<leader>t', '<cmd>AerialToggle!<CR>')
vim.keymap.set('n', '<leader>t', '<cmd>Lspsaga outline<CR>', { desc = "cmd-s-l" })
vim.keymap.set('n', '<D-r>', '<cmd>RunCurrentFile<CR>')

vim.api.nvim_set_keymap('n', '<Esc>[27;5;48~', ':echo "Command-0 pressed!"<CR>', {noremap = true, silent = true})
