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

vim.keymap.set('n', '<leader>sg', '<CMD>FloatermNew --width=0.9 --height=0.8 lazygit<CR>', { desc = 'cmd-s-g' })

vim.keymap.set('n', '<leader>ft', '<CMD>FloatermToggle<CR>')
vim.keymap.set('t', '<leader>ft', '<C-\\><C-n><CMD>FloatermToggle<CR>')

vim.keymap.set('n', '<leader>fp', '<CMD>FloatermPrev<CR>', { desc = 'cmd-left' })
vim.keymap.set('n', '<leader>fn', '<CMD>FloatermNext<CR>', { desc = 'cmd-right' })
vim.keymap.set('t', '<leader>fp', '<C-\\><C-n><CMD>FloatermPrev<CR>', { desc = 'cmd-left' })
vim.keymap.set('t', '<leader>fn', '<C-\\><C-n><CMD>FloatermNext<CR>', { desc = 'cmd-right' })
vim.keymap.set('n', '<leader>sp', "<cmd>Telescope<cr>", { desc = 'cmd-s-p' })
vim.keymap.set('v', '<leader>sp', "<cmd>Telescope<cr>", { desc = 'cmd-s-p' })
vim.keymap.set('n', '<leader>sb', '<cmd>FloatermNew --name=ipython --wintype=vsplit --width=0.5 ipython<CR>', { desc = 'cmd-s-b' })
vim.keymap.set('v', '<leader>sb', "<cmd>'<,'>FloatermNew --name=ipython --wintype=vsplit --width=0.5 ipython<CR>", { desc = 'cmd-s-b' })

vim.keymap.set('t', '<leader>bb', '<C-\\><C-n><CMD>Terminal<CR>', { desc = 'cmd-b' })
vim.keymap.set('n', '<leader>bb', '<cmd>Terminal<CR>', { desc = 'cmd-b' })

vim.keymap.set('n', '<c-n>', '<cmd>GotoCurrentPath<CR>')
vim.keymap.set('n', '<leader>yy', '<cmd>Y<CR>')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-9>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-2>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-1>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-0>', '<Cmd>BufferNext<CR>', opts)

map('n', 'L', '<Cmd>Lspsaga', opts)

map('n', '<leader>00', '<C-\\><C-n><Cmd>FloatermToggle<CR>', opts)
map('t', '<leader>00', '<C-\\><C-n><Cmd>FloatermToggle<CR>', opts)
map('v', '<leader>00', '<C-\\><C-n><Cmd>FloatermToggle<CR>', opts)
map('i', '<leader>00', '<C-\\><C-n><Cmd>FloatermToggle<CR>', opts)
map('n', '<leader>ll', '<C-\\><C-n><Cmd>AvanteToggle<CR>', opts)
map('v', '<leader>ll', '<C-\\><C-n><Cmd>AvanteToggle<CR>', opts)
map('t', '<leader>ll', '<C-\\><C-n><Cmd>AvanteToggle<CR>', opts)
map('i', '<leader>ll', '<C-\\><C-n><Cmd>AvanteToggle<CR>', opts)

map('n', '<space><space>', '<C-\\><C-n><Cmd>AvanteAsk explain in Chinese<CR>', opts)

-- map('n', '<leader>rr', '<Cmd>Telescope resume<CR>',
--   { noremap = true, silent = true, desc = 'Resume last telescope picker' })

map('n', '<leader>ee', '<Cmd>Telescope find_files theme=dropdown<CR>', { noremap = true, silent = true, desc = 'cmd-e' })
map('n', '<C-e>', '<Cmd>Telescope find_files theme=dropdown<CR>', { noremap = true, silent = true, desc = 'cmd-e' })
map('n', '<C-d>', '<Cmd>Telescope buffers theme=dropdown<CR>', { noremap = true, silent = true, desc = 'List buffers' })

map('n', '<leader>ff', '<Cmd>Telescope live_grep theme=dropdown<CR>', { noremap = true, silent = true, desc = 'cmd-f' })
map('n', '<C-f>', '<Cmd>Telescope live_grep theme=dropdown<CR>', { noremap = true, silent = true, desc = 'Live grep' })

-- Search current word in projecr files
map('n', '<leader>w', '<Cmd>Telescope grep_string theme=dropdown<CR>', { noremap = true, silent = true, desc = 'Grep current word' })

-- Search tags in current buffer (requires .tags file)
map('n', '<leader>sy', '<Cmd>Telescope current_buffer_tags theme=dropdown ctags_file=.tags<CR>', { noremap = true, silent = true, desc = 'cmd-s-y' })

-- Search tags in project (requires .tags file)
map('n', '<leader>so', '<Cmd>Telescope tags theme=dropdown ctags_file=.tags<CR>', { noremap = true, silent = true, desc = 'cmd-s-o' })
map('n', '<leader>d', '<Cmd>Telescope diagnostics theme=dropdown<CR>', { noremap = true, silent = true, desc = 'Show diagnostics' })
map('n', '<leader>sr', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true, desc = 'cmd-s-r' })
map('n', '<leader>ii', '<cmd>Telescope lsp_definitions<CR>', { noremap = true, silent = true, desc = 'cmd-i' })
map('n', '<leader>si', '<cmd>sp | Telescope lsp_definitions<CR>', { noremap = true, silent = true, desc = 'cmd-s-i' })
map('n', '<leader>sv', '<cmd>vsp | Telescope lsp_definitions<CR>', { noremap = true, silent = true, desc = 'cmd-s-v' })

map('n', '<leader>ss', '<Cmd>w<CR>', { noremap = true, silent = true, desc = 'cmd-s' })

map('n', '<C-o>', '<cmd>edit #<CR>', opts)
map('n', '<leader>oo', '<cmd>edit #<CR>', opts)
map('n', '[d', '<cmd>bprev<CR>', opts)
map('n', ']d', '<cmd>bnext<CR>', { noremap = true, silent = true, desc = 'cmd-s-p' })

-- vim.keymap.set('n', '<leader>t', '<cmd>AerialToggle!<CR>')
vim.keymap.set('n', '<leader>t', '<cmd>Lspsaga outline<CR>', { desc = "cmd-s-l" })
vim.keymap.set('n', '<leader>rr', '<cmd>RunCurrentFile<CR>')
