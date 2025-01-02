-- 自动保存插件，在特定事件触发时自动保存文件
return {
  lazy = true,
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup {
      trigger_events = {"InsertLeave", "TextChanged", "FocusLost"}, -- vim events that trigger auto-save. See :h events
    }
  end,
}
