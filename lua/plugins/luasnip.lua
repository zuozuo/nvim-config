return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local ls = require("luasnip")
    ls.setup({})
    require("luasnip.loaders.from_vscode").lazy_load({
      include = { "python" }
    })
  end
}
