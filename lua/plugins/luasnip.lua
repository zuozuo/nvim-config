return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "1.2.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_snipmate").lazy_load({
      path = { "~/.config/nvim/snippets" },
      include = { "python", "lua", "javascript", "vim", "bash", "markdown"},
    })
  end
}

