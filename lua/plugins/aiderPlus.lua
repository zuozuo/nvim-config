-- Aider 增强插件，提供 AI 辅助编程功能，基于 OpenAI 的代码生成和补全
return {
  dir = "/Users/bytedance/workspace/projects",
  lazy = true,
  dependencies = {
    "nvim-lspconfig"
  },
  config = function()
    require("aider-nvim").setup({
      -- Configuration options
    })
  end,
}
