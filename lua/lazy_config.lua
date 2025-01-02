table.unpack = table.unpack or unpack -- 5.1 compatibility

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

local requireAll = require("require_all")

local plugins = {
  -- this must called before lspconfig
  -- require("plugins.lua_neodev"),
  table.unpack(requireAll("plugins"))
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
  },
}

require("lazy").setup(plugins, options)
