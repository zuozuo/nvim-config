local openCurrentCursor = function()
  local word = vim.fn.expand("<cword>")
  local line = vim.fn.getline(".")
  print(word)
  print(line)
end
vim.api.nvim_create_user_command("OpenCurrentCursor", openCurrentCursor, {})
