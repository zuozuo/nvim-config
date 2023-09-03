local function testChat()
  local cmd =
      "FloatermNew! --height=0.99 --width=0.99 --wintype=float python manage.py test_chat " ..
      "--path=testing_data/yaml/en"
  vim.cmd(cmd)
end
vim.api.nvim_create_user_command("TestChatbot", testChat, {})

