vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('n', 'Y', 'yy', {desc = 'Copy line'})
vim.keymap.set('n', 'qq', '<cmd>quit<cr>', {desc = 'Quit buffer'})

-- vim.keymap.set('n', 'gd', '<cmd>Ddd<cr>', {desc = 'Grep current word in project'})

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<C-9>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-2>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-1>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<M-1>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-0>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-w>', '<Cmd>BufferClose<CR>', opts)
map('n', '<C-q>', '<Cmd>BufferClose<CR>', opts)

map('n', '<leader>e', '<Cmd>Telescope find_files theme=dropdown<CR>', opts)
map('n', '<C-e>', '<Cmd>Telescope find_files theme=dropdown<CR>', opts)
map('n', '<C-d>', '<Cmd>Telescope buffers theme=dropdown<CR>', opts)
map('n', '<leader>f', '<Cmd>Telescope live_grep theme=dropdown<CR>', opts)
map('n', '<C-f>', '<Cmd>Telescope live_grep theme=dropdown<CR>', opts)
map('n', '<leader>w', '<Cmd>Telescope current_buffer_tags theme=dropdown<CR>', opts)
map('n', '<leader>d', '<Cmd>Telescope diagnostics theme=dropdown<CR>', opts)
map('n', '<C-]>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<C-[>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('i', 'ddd', 'import ipdb; ipdb.set_trace(context=5)', opts)

map('n', '<LEADER>gd', '<cmd>Telescope lsp_definitions<CR>', opts)
map('n', '<LEADER>gs', '<cmd>sp | Telescope lsp_definitions<CR>', opts)
map('n', '<LEADER>gv', '<cmd>vsp | Telescope lsp_definitions<CR>', opts)

map('n', '<C-o>', '<cmd>edit #<CR>', opts)
map('n', '<C-p>', '<cmd>bprev<CR>', opts)

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
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

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
