-- 快速跳转插件，提供高效的代码导航功能
return {
  lazy = true,
  "folke/flash.nvim",
  -- event = "VeryLazy",
  -- ---@type Flash.Config
  -- opts = {},
  -- -- stylua: ignore
  -- keys = {
  --   { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --   -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --   -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --   -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  -- },
}
