local copyTestCommand = function()
  local path = vim.fn.expand('%:p')
  if (path == "") then
    print("Current path is empty")
    return
  end
  local cmd = "FloatermNew --silent echo " .. "python manage.py test_chat --path=" .. path .. " | pbcopy"
  print("test command copied to clipboard: ")
  vim.cmd(cmd)
  vim.cmd('stopinsert')
end
vim.api.nvim_create_user_command("CopyTestCommand", copyTestCommand, {})

