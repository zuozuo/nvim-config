return {
  lazy = true,
  "olimorris/codecompanion.nvim",
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  --   "nvim-treesitter/nvim-treesitter",
  --   -- "hrsh7th/nvim-cmp",
  --   "nvim-telescope/telescope.nvim",
  -- },
  -- config = function()
  --   require("codecompanion").setup({
  --     opts = {
  --       language = "Chinese" -- Default is "English"
  --     },
  --     strategies = {
  --       chat = {
  --         adapter = "ollama",
  --       },
  --       inline = {
  --         adapter = "ollama",
  --       },
  --       agent = {
  --         adapter = "llama3",
  --       },
  --       display = {
  --         chat = {
  --           window = {
  --             layout = "float", -- float|vertical|horizontal|buffer
  --           },
  --         },
  --       },
  --     },
  --     adapters = {
  --       ollama = function()
  --         return require("codecompanion.adapters").extend("openai_compatible", {
  --           env = {
  --             url = "https://api.deepseek.com", -- optional: default value is ollama url http://127.0.0.1:11434
  --             api_key = "sk-a28c0749cf6949708f79697c231e7cce", -- optional: if your endpoint is authenticated
  --             chat_url = "/v1/chat/completions", -- optional: default value, override if different
  --           },
  --         })
  --       end,
  --     },
  --   })
  -- end
}
-- AI 代码助手插件，提供代码生成、补全和重构等功能