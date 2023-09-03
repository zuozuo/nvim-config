local function iChat()
  local cmd =
      "FloatermNew! --wintype=float --height=0.95 --position=bottom --width=0.99 " ..
      "python manage.py ichat"
  vim.cmd(cmd)
end

vim.api.nvim_create_user_command("Ichat", iChat, {})
