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

vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '9', '^')
vim.keymap.set('n', '0', '$')
vim.keymap.set('v', '9', '^')
vim.keymap.set('v', '0', '$')


vim.keymap.set('n', ',ae', 'v,ae')
vim.keymap.set('i', ',ae', '<esc>V')
vim.keymap.set('v', ',ha', ',aa explain<esc>')

vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('t', '<c-j>', '<C-\\><C-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<C-\\><C-n><c-w>k')
vim.keymap.set('t', '<c-h>', '<C-\\><C-n><c-w>h')
vim.keymap.set('t', '<c-l>', '<C-\\><C-n><c-w>l')

vim.keymap.set('i', '<c-j>', '<C-\\><C-n><c-w>j')
vim.keymap.set('i', '<c-k>', '<C-\\><C-n><c-w>k')
vim.keymap.set('i', '<c-h>', '<C-\\><C-n><c-w>h')
vim.keymap.set('i', '<c-l>', '<C-\\><C-n><c-w>l')

vim.keymap.set('n', 'Y', 'yy', { desc = 'Copy line' })
vim.keymap.set('n', 'qq', '<cmd>quit<cr>', { desc = 'Quit buffer' })
vim.cmd("nmap bb :BufferGoto ")

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })


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

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<ESC>', '<cmd>Lspsaga diagnostic_jump_next<CR>')
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "cmd-]" })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "cmd-[" })
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

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("normal! zz")
    end,
})

local ls = require("luasnip")
vim.keymap.set({ "s" }, "<Tab>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "s" }, "<S-Tab>", function() ls.jump(-1) end, { silent = true })


-- Reload whid.nvim plugin
vim.api.nvim_create_user_command('ReloadWhid', function()
    -- Unload the module
    package.loaded['whid'] = nil
    package.loaded['whid.init'] = nil
    
    -- Reload the module
    require('whid').setup()
    
    print("whid.nvim reloaded!")
end, {})
