-- cURL 命令集成插件，可直接在 Neovim 中执行 HTTP 请求
return {
  lazy = true,
  "oysandvik94/curl.nvim",
  cmd = { "CurlOpen" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
}
