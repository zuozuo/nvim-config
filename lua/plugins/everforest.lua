return {
  "neanias/everforest-nvim",
  version = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("everforest").setup({
      -- Your config here
    })
  end,
}
