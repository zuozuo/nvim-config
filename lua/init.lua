--
-- https://superuser.com/questions/387897/can-i-use-the-cmd-key-in-terminal-vim-at-all
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- https://github.com/VonHeikemen/nvim-starter/tree/01-base
--

-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --

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

---- ========================================================================== --
-- ==                               PLUGINS                                == --
-- ========================================================================== --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"folke/tokyonight.nvim"},
  'numToStr/Comment.nvim',
  { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    'neoclide/coc.nvim',
    branch = 'release',
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    -- config = function()
    -- end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    '/lewis6991/gitsigns.nvim'
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  'xiyaowong/nvim-cursorword',
  'nmac427/guess-indent.nvim',
  'lukas-reineke/lsp-format.nvim',
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  ------   COLOR THEMES   ------
  { 'projekt0n/github-nvim-theme' },
  { 'ellisonleao/gruvbox.nvim', priority = 1000 },
  { 'luisiacc/gruvbox-baby' },
  { 'sainnhe/gruvbox-material' },
  { 'sainnhe/sonokai' },
  { 'ful1e5/onedark.nvim' },
  { 'EdenEast/nightfox.nvim' },
  { 'marko-cerovac/material.nvim' },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'projekt0n/github-nvim-theme' },
})

require('dashboard').setup {
  theme = 'hyper', --  theme is doom and hyper default is hyper
  disable_move,    --  default is false disable move keymap for hyper
  shortcut_type,   --  shorcut type 'letter' or 'number'
  change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
  config = {},    --  config used for theme
  hide = {
    statusline,    -- hide statusline default is true
    tabline,       -- hide the tabline
    winbar,        -- hide winbar
  },
  preview = {
    command,       -- preview command
    file_path,     -- preview file path
    file_height,   -- preview file height
    file_width,    -- preview file width
  },
}


--require("lsp-format").setup {}
--local on_attach = function(client)
    --require("lsp-format").on_attach(client)
    -- ... custom code ...
--end
--require("lspconfig").gopls.setup { on_attach = on_attach }

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

require('guess-indent').setup({})

-- xiyaowong/nvim-cursorword'
vim.cmd("hi default CursorWord cterm=underline gui=underline")

vim.g.barbar_auto_setup = false -- disable auto-setup
require('barbar').setup({
  icons = {
    -- Configure the base icons on the bufferline.
    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = false,
    buffer_number = false,
    semantic_letters = false,
    button = '🍀',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = false, icon = '😱'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = false},
    },
    gitsigns = {
      added = {enabled = false, icon = '+'},
      changed = {enabled = false, icon = '~'},
      deleted = {enabled = false, icon = '-'},
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = false,
    },
    separator = {left = '▎', right = ''},

    -- If true, add an additional separator at the end of the buffer list
    separator_at_end = true,

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = {button = '●'},
    pinned = {button = '🐶', filename = false},

    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = 'default',

    -- Configure the icons on the bufferline based on the visibility of a buffer.
    -- Supports all the base icon options, plus `modified` and `pinned`.
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
    tabpages = false,
  },
})

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})


local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'C', api.tree.change_root_to_node,        opts('Change root to current node'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end
-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  on_attach = my_on_attach,
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        modified = false,
      }
    }
  },
  filters = {
    dotfiles = true,
  },
})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  cmdline = {
    format = {
      cmdline = { icon = "🍏" },
      search_down = { icon = "🍑" },
      search_up = { icon = "🍑" },
      filter = { icon = "🧅" },
      lua = { icon = "🍋" },
      help = { icon = "🍅" },
    },
  },
  format = {
    level = {
      icons = {
        error = "✖",
        warn = "▼",
        info = "●",
      },
    },
  },
  popupmenu = {
    kind_icons = false,
  },
  inc_rename = {
    cmdline = {
      format = {
        IncRename = { icon = "⟳" }
      },
    },
  },
})

require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<C-l>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt"},
  log_file_path = nil, -- absolute path to Tabnine log file
})

require('Comment').setup({
    ignore = '^$',
})

require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
vim.keymap.set('n', '<leader>t', '<cmd>AerialToggle!<CR>')

require("notify").setup({
  background_colour = "NotifyBackground",
  fps = 30,
  icons = {
    DEBUG = "🤡",
    ERROR = "😱",
    INFO = "😍",
    TRACE = "🤔",
    WARN = "😲",
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade_in_slide_out",
  timeout = 5000,
  top_down = true
})

require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 300,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- ========================================================================== --
-- ==                             KEYBINDINGS                              == --
-- ========================================================================== --

vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('n', 'Y', 'yy', {desc = 'Copy line'})
vim.keymap.set('n', 'qq', '<cmd>quit<cr>', {desc = 'Quit buffer'})
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', {desc = 'File Explorer'})
vim.keymap.set('n', '<leader>e', '<cmd>FzfLua files<cr>', {desc = 'Search files'})
vim.keymap.set('n', '<c-e>', '<cmd>FzfLua files<cr>', {desc = 'Search files'})
vim.keymap.set('n', '<leader>d', '<cmd>FzfLua buffers<cr>', {desc = 'Search buffered files'})
vim.keymap.set('n', '<c-d>', '<cmd>FzfLua buffers<cr>', {desc = 'Search buffered files'})
vim.keymap.set('n', '<leader>f', '<cmd>FzfLua grep<cr>', {desc = 'Grep in project'})
vim.keymap.set('n', '<c-f>', '<cmd>FzfLua grep<cr>', {desc = 'Grep in project'})
vim.keymap.set('n', '<leader>w', '<cmd>FzfLua grep_cword<cr>', {desc = 'Grep current word in project'})

vim.keymap.set('n', 'gd', '<cmd>Ddd<cr>', {desc = 'Grep current word in project'})

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

-- local function opts(desc)
--   return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
-- end
-- local api = require "nvim-tree.api"
-- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))

local api = require('Comment.api')
vim.keymap.set('n', 'cc', api.toggle.linewise.current)

local esc = vim.api.nvim_replace_termcodes(
'<ESC>', true, false, true
)
vim.keymap.set('x', 'cc', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  api.toggle.linewise(vim.fn.visualmode())
end)


-- ========================================================================== --
-- ==                               COMMANDS                               == --
-- ========================================================================== --

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})
vim.api.nvim_create_user_command('EditConfigVim', 'edit ~/.config/nvim/init.vim', {})
vim.api.nvim_create_user_command('EditConfig', 'edit ~/.config/nvim/lua/init.lua', {})
vim.api.nvim_create_user_command('EditConfigLua', 'edit ~/.config/nvim/lua/', {})
vim.api.nvim_create_user_command('Blame', 'Gitsigns toggle_current_line_blame', {})
vim.api.nvim_create_user_command('Lint', 'CocList diagnostics', {})
vim.api.nvim_create_user_command('Python', 'CocCommand python.setInterpreter', {})
vim.api.nvim_create_user_command('FindFile', 'NvimTreeFocus', {})
vim.api.nvim_create_user_command('Ttt', 'belowright split | terminal', {})
vim.api.nvim_create_user_command('Ddd', 'belowright split | call CocActionAsync("jumpDefinition")', {})
vim.api.nvim_create_user_command('Hhh', 'call CocActionAsync("jumpDefinition") | belowright split', {})


-- ========================================================================== --
-- ==                             COLOR THEMES                             == --
-- ========================================================================== --
-- vim.cmd("colorscheme desert")
vim.cmd("colorscheme sonokai")
