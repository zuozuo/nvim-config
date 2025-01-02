-- 代码片段插件，提供快速插入代码片段功能，支持多种编程语言
return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "1.2.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  lazy = true,
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_snipmate").lazy_load({
      path = { "~/.config/nvim/snippets" },
      include = { "html", "css", "python", "lua", "javascript", "zsh", "vim", "bash", "markdown", "typescriptreact",
        "typescript" },
    })
  end
}
