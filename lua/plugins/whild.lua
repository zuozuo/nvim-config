return {
   dir = "/Users/yonghuizuo/workspace/neovim/whid.nvim",  -- 替换为你的插件实际路径
   name = "whid",                    -- 可选，给插件命名
   config = function()
      require("whid").setup()
   end,
}
