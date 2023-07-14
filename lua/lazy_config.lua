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

local plugins = {
  require("plugins.colorthemes"),
  require("plugins.dashboard"),
  require("plugins.comment"),
  require("plugins.tabnine"),
  require("plugins.aerial"),
  require("plugins.nvim_tree"),
  require("plugins.autopairs"),
  require("plugins.noice"),
  require("plugins.notify"),
  require("plugins.gitsigns"),
  require("plugins.barbar"),
  require("plugins.lualine"),
  require("plugins.guess_indent"),
  require("plugins.treesitter"),
  require("plugins.treesitter_context"),
  require("plugins.telescope"),
  -- this must called before lspconfig
  require("plugins.lua_neodev"),
  require("plugins.lspconfig"),
  require("plugins.mason"),
  require("plugins.mason_lspconfig"),
  require("plugins.complete"),
  require("plugins.luasnip"),
  require("plugins.floatterm"),
  require("plugins.plenary"),
  require("plugins.wilder"),
  require("plugins.leap"),
  require("plugins.flit"),
  require("plugins.autosave"),
  -- require("plugins.which_key"),
}

local options = {
  install = {
    -- try to load the colorscheme when installing missing plugins at startup (e.g. before loading any plugins)
    colorscheme = { 'desert' }
  },
  dev = {
    path = "~/.nvim-plugins", -- dir where local plugins are stored
    patterns = {"Frydac"}, -- plugins that match will be searched in repos dir
    fallback = true, -- fallback to url
  }
}

require("lazy").setup(plugins, options)
