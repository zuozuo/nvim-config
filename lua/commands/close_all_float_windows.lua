local closeAllFloatingWindows = function()
  for a = 0, 20 do
    local result = vim.api.nvim_exec("FloatermKill", true)
    if (result ~= "") then
      print("Successfully closed " .. a .. " floating windows")
      break
    end
  end
end
vim.api.nvim_create_user_command("CloseAllFloatingWindows", closeAllFloatingWindows, {})
