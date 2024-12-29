local kittyStartupTabs = function()
  local cmd = string.format('FloatermNew --wintype=vsplit --floaterm_autoclose=2 --width=0.5 ~/.config/scripts/kitty_startup_tabs')
  vim.cmd(cmd)
  -- vim.cmd("5sleep")
  -- vim.cmd("qa!")
end
vim.api.nvim_create_user_command("KittyStartupTabs", kittyStartupTabs, {})
