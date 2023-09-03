local chatGPT = function()
  time = os.date("%Y-%m-%d")
  vim.cmd("vs ~/.config/nvim/prompts/conversation_" .. time ..".md")
end
vim.api.nvim_create_user_command("ChatGPT", chatGPT, {})
