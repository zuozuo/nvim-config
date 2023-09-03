local showCurrentPath = function()
  local path = vim.fn.expand('%:p')
  if (path == "") then
    print("Current path is empty")
    return
  end
  local cmd = "FloatermNew --silent echo " .. path .. " | pbcopy"
  print("current file path copied to clipboard: ")
  print(path)
  vim.cmd(cmd)
  vim.cmd('stopinsert')
end
vim.api.nvim_create_user_command("FullPath", showCurrentPath, {})

