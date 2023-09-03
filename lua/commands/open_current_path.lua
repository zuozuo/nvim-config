function extractPath(longString)
  local path = longString:match("path:%s*(.-)%s*$")
  if not path then
    path = longString:match("(%S+%.%S+)$")
  end
  return path
end

local gotoCurrentPath = function()
  local string = vim.fn.getline('.')
  local path = extractPath(string)
  if (path ~= nil) then
    print(path)
    local cmd = "e " .. path
    print(cmd)
    vim.cmd(cmd)
  else
    print()
  end
end

vim.api.nvim_create_user_command("GotoCurrentPath", gotoCurrentPath, {})
vim.api.nvim_create_user_command("GOTOCurrentPath", gotoCurrentPath, {})
