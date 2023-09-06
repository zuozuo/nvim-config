local chatGPT = function()
  time = os.date("%Y_%m_%d_%H")
  vim.cmd("vs ~/.config/nvim/prompts/conversation_" .. time .. ".md")
  vim.cmd("write")
end
vim.api.nvim_create_user_command("ChatGPT", chatGPT, {})
vim.api.nvim_create_user_command("CHatGPT", chatGPT, {})
