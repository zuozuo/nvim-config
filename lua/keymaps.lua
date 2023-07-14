vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '9', '^')
vim.keymap.set('n', '0', '$')

vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('t', '<c-j>', '<C-\\><C-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<C-\\><C-n><c-w>k')
vim.keymap.set('t', '<c-h>', '<C-\\><C-n><c-w>h')
vim.keymap.set('t', '<c-l>', '<C-\\><C-n><c-w>l')

vim.keymap.set('n', 'Y', 'yy', {desc = 'Copy line'})
vim.keymap.set('n', 'qq', '<cmd>quit<cr>', {desc = 'Quit buffer'})
vim.cmd("nmap bb :BufferGoto ")

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })

vim.keymap.set('n', '<leader>gi', '<CMD>FloatermNew lazygit<CR>')

vim.keymap.set('n', '<leader>ft', '<CMD>FloatermToggle<CR>')
vim.keymap.set('t', '<leader>ft', '<C-\\><C-n><CMD>FloatermToggle<CR>')
vim.keymap.set('n', '<leader>fp', '<CMD>FloatermPrev<CR>')
vim.keymap.set('n', '<leader>fn', '<CMD>FloatermNext<CR>')
vim.keymap.set('t', '<leader>fp', '<C-\\><C-n><CMD>FloatermPrev<CR>')
vim.keymap.set('t', '<leader>fn', '<C-\\><C-n><CMD>FloatermNext<CR>')

vim.keymap.set('n', '<leader>si', '<CMD>FloatermToggle<CR>')
vim.keymap.set('t', '<leader>si', '<C-\\><C-n><CMD>FloatermToggle<CR>')
vim.keymap.set('n', '<leader>vi', '<cmd>FloatermNew --name=ipython --wintype=vsplit --width=0.4 ipython<CR>')
vim.keymap.set('v', '<leader>vi', "<cmd>'<,'>FloatermNew --name=ipython --wintype=vsplit --width=0.4 ipython<CR>")
vim.keymap.set('n', '<leader>sr', '<cmd>RunCurrentFile<CR>')

vim.keymap.set('n', '<space><space>', '<cmd>FloatermToggle<CR>')
vim.keymap.set('t', '<esc>', '<C-\\><C-n><CMD>FloatermToggle<CR>')


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<space>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<space>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<space>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<space>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<space>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<space>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<space>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<space>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>9', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-2>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-1>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>0', '<Cmd>BufferNext<CR>', opts)

map('n', '<leader>ee', '<Cmd>Telescope find_files theme=dropdown<CR>', opts)
map('n', '<C-e>', '<Cmd>Telescope find_files theme=dropdown<CR>', opts)
map('n', '<C-d>', '<Cmd>Telescope buffers theme=dropdown<CR>', opts)
map('n', '<leader>ff', '<Cmd>Telescope live_grep theme=dropdown<CR>', opts)
map('n', '<C-f>', '<Cmd>Telescope live_grep theme=dropdown<CR>', opts)
map('n', '<leader>w', '<Cmd>Telescope grep_string theme=dropdown<CR>', opts)
map('n', '<leader>ct', '<Cmd>Telescope current_buffer_tags theme=dropdown ctags_file=.tags<CR>', opts)
map('n', '<leader>gt', '<Cmd>Telescope tags theme=dropdown ctags_file=.tags<CR>', opts)
map('n', '<leader>d', '<Cmd>Telescope diagnostics theme=dropdown<CR>', opts)
map('n', '<C-]>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<C-[>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- map('i', 'ddd', 'import ipdb; ipdb.set_trace(context=5)', opts)

map('n', '<LEADER>gd', '<cmd>Telescope lsp_definitions<CR>', opts)
map('n', '<LEADER>gs', '<cmd>sp | Telescope lsp_definitions<CR>', opts)
map('n', '<LEADER>gv', '<cmd>vsp | Telescope lsp_definitions<CR>', opts)

map('n', '<leader>ep', '<cmd>edit #<CR>', opts)
map('n', '<C-p>', '<cmd>bprev<CR>', opts)
map('n', '<leader>bn', '<cmd>bnext<CR>', opts)
map('n', '<leader>ter', '<cmd>Ttt<CR>', opts)


local function opts(desc)
  return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end
local api = require "nvim-tree.api"
vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', {desc = 'File Explorer'})

local api = require('Comment.api')
vim.keymap.set('n', 'cc', api.toggle.linewise.current)

local esc = vim.api.nvim_replace_termcodes(
'<ESC>', true, false, true
)
vim.keymap.set('x', 'cc', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  api.toggle.linewise(vim.fn.visualmode())
end)

vim.keymap.set('n', '<leader>t', '<cmd>AerialToggle!<CR>')

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>e', vim.diagnostic.setloclist)
vim.keymap.set('n', '<space>w', vim.diagnostic.setqflist)

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
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
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
vim.keymap.set({"s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
