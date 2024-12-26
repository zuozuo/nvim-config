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
-- cmd-b open float terminal
-- space-space open split terminal
-- cmd-s-b open ipython
-- cmd-s save file
-- cmd-i goto definition
-- cmd-s-i goto definition split
-- cmd-s-v goto definition vsplit
-- cmd-p goto previous buffer 
-- cmd-o goto next buffer
-- cc comment current line
-- ,n open file tree
-- ,d show telescope diagnostic

vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '9', '^')
vim.keymap.set('n', '0', '$')
vim.keymap.set('v', '9', '^')
vim.keymap.set('v', '0', '$')

vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('t', '<c-j>', '<C-\\><C-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<C-\\><C-n><c-w>k')
vim.keymap.set('t', '<c-h>', '<C-\\><C-n><c-w>h')
vim.keymap.set('t', '<c-l>', '<C-\\><C-n><c-w>l')

vim.keymap.set('n', 'Y', 'yy', { desc = 'Copy line' })
vim.keymap.set('n', 'qq', '<cmd>quit<cr>', { desc = 'Quit buffer' })
vim.cmd("nmap bb :BufferGoto ")

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })


vim.keymap.set('n', '<leader>sg', '<CMD>FloatermNew --width=0.9 --height=0.8 lazygit<CR>', { desc = 'cmd-s-g' })

-- vim.keymap.set('n', '<leader>ft', '<CMD>FloatermToggle<CR>')
-- vim.keymap.set('t', '<leader>ft', '<C-\\><C-n><CMD>FloatermToggle<CR>')

vim.keymap.set('n', '<leader>fp', '<CMD>FloatermPrev<CR>', { desc = 'cmd-left' })
vim.keymap.set('n', '<leader>fn', '<CMD>FloatermNext<CR>', { desc = 'cmd-right' })
vim.keymap.set('t', '<leader>fp', '<C-\\><C-n><CMD>FloatermPrev<CR>', { desc = 'cmd-left' })
vim.keymap.set('t', '<leader>fn', '<C-\\><C-n><CMD>FloatermNext<CR>', { desc = 'cmd-right' })
vim.keymap.set('t', '<leader>bb', '<C-\\><C-n><CMD>Terminal<CR>', { desc = 'cmd-b' })
vim.keymap.set('n', '<leader>bb', '<cmd>Terminal<CR>', { desc = 'cmd-b' })
vim.keymap.set('n', '<leader>sp', "<cmd>Telescope<cr>", { desc = 'cmd-s-p' })
vim.keymap.set('v', '<leader>sp', "<cmd>Telescope<cr>", { desc = 'cmd-s-p' })
vim.keymap.set('n', '<leader>sb', '<cmd>FloatermNew --name=ipython --wintype=vsplit --width=0.5 ipython<CR>', { desc = 'cmd-s-b' })
vim.keymap.set('v', '<leader>sb', "<cmd>'<,'>FloatermNew --name=ipython --wintype=vsplit --width=0.5 ipython<CR>", { desc = 'cmd-s-b' })

-- vim.keymap.set('n', '<space><space>', '<cmd>TerminalSplit<CR>')
-- vim.keymap.set('t', ',hh', '<C-\\><C-n><CMD>FloatermToggle<CR>')
-- vim.keymap.set('n', ',hh', '<C-\\><C-n><CMD>FloatermToggle<CR>')
-- vim.keymap.set('n', '<esc>', '<C-\\><C-n><CMD>FloatermToggle<CR>')

vim.keymap.set('n', '<c-n>', '<cmd>GotoCurrentPath<CR>')


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-9>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-2>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-1>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-0>', '<Cmd>BufferNext<CR>', opts)

-- map('n', '<leader>rr', '<Cmd>Telescope resume<CR>',
--   { noremap = true, silent = true, desc = 'Resume last telescope picker' })

map('n', '<leader>ee', '<Cmd>Telescope find_files theme=dropdown<CR>', { noremap = true, silent = true, desc = 'cmd-e' })
map('n', '<C-e>', '<Cmd>Telescope find_files theme=dropdown<CR>', { noremap = true, silent = true, desc = 'cmd-e' })
map('n', '<C-d>', '<Cmd>Telescope buffers theme=dropdown<CR>', { noremap = true, silent = true, desc = 'List buffers' })

map('n', '<leader>ff', '<Cmd>Telescope live_grep theme=dropdown<CR>', { noremap = true, silent = true, desc = 'cmd-f' })
map('n', '<C-f>', '<Cmd>Telescope live_grep theme=dropdown<CR>', { noremap = true, silent = true, desc = 'Live grep' })

map('n', '<leader>w', '<Cmd>Telescope grep_string theme=dropdown<CR>', { noremap = true, silent = true, desc = 'Grep current word' })
map('n', '<leader>sy', '<Cmd>Telescope current_buffer_tags theme=dropdown ctags_file=.tags<CR>', { noremap = true, silent = true, desc = 'cmd-s-y' })
map('n', '<leader>so', '<Cmd>Telescope tags theme=dropdown ctags_file=.tags<CR>', { noremap = true, silent = true, desc = 'cmd-s-o' })
map('n', '<leader>d', '<Cmd>Telescope diagnostics theme=dropdown<CR>', { noremap = true, silent = true, desc = 'Show diagnostics' })
map('n', '<leader>sr', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true, desc = 'cmd-s-r' })
map('n', '<leader>ii', '<cmd>Telescope lsp_definitions<CR>', { noremap = true, silent = true, desc = 'cmd-i' })
map('n', '<leader>si', '<cmd>sp | Telescope lsp_definitions<CR>', { noremap = true, silent = true, desc = 'cmd-s-i' })
map('n', '<leader>sv', '<cmd>vsp | Telescope lsp_definitions<CR>', { noremap = true, silent = true, desc = 'cmd-s-v' })

map('n', '<leader>ss', '<Cmd>w<CR>', { noremap = true, silent = true, desc = 'cmd-s' })

map('n', '<C-o>', '<cmd>edit #<CR>', opts)
map('n', '<leader>pp', '<cmd>bprev<CR>', { noremap = true, silent = true, desc = 'cmd-p' })
map('n', '<leader>oo', '<cmd>bnext<CR>', { noremap = true, silent = true, desc = 'cmd-o' })

local function opts(desc)
  return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end
local api = require "nvim-tree.api"
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', { desc = 'File Explorer' })
-- vim.keymap.set('n', '<leader>pp', '<cmd>Y<cr>', { desc = 'File Explorer' })

local api = require('Comment.api')
vim.keymap.set('n', 'cc', api.toggle.linewise.current)

local esc = vim.api.nvim_replace_termcodes(
  '<ESC>', true, false, true
)
vim.keymap.set('x', 'cc', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  api.toggle.linewise(vim.fn.visualmode())
end)

-- vim.keymap.set('n', '<leader>t', '<cmd>AerialToggle!<CR>')
vim.keymap.set('n', '<leader>t', '<cmd>Lspsaga outline<CR>', { desc = "cmd-s-l" })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<ESC>', '<cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "cmd-]" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "cmd-[" })
-- vim.keymap.set('n', '<space>e', vim.diagnostic.setloclist)
-- vim.keymap.set('n', '<space>w', vim.diagnostic.setqflist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local ls = require("luasnip")
vim.keymap.set({ "s" }, "<Tab>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "s" }, "<S-Tab>", function() ls.jump(-1) end, { silent = true })
