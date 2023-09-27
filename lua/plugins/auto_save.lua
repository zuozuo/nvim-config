return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup {
      trigger_events = {"InsertLeave", "TextChanged", "FocusLost"}, -- vim events that trigger auto-save. See :h events
    }
  end,
}
