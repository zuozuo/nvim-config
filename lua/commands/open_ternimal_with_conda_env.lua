-- 获取当前 conda 环境的函数
local function get_conda_env()
  local handle = io.popen('conda info --envs | grep "*" | cut -d" " -f1')
  if handle == nil then return "" end
  
  local result = handle:read("*a")
  handle:close()
  return vim.trim(result)
end

local openFloatTerminal = function()
  local conda_env = get_conda_env()
  local cmd = string.format('FloatermNew --autoclose=0 zsh')
  vim.cmd(cmd)
  local text = string.format('FloatermSend conda activate %s && clear', conda_env)
  vim.cmd(text)
end

local openSplitTerminal = function()
  local conda_env = get_conda_env()
  local cmd = string.format('FloatermNew --wintype=vsplit --width=0.5 --autoclose=0 zsh')
  vim.cmd(cmd)
  local text = string.format('FloatermSend conda activate %s && clear', conda_env)
  vim.cmd(text)
end

vim.api.nvim_create_user_command("Terminal", openFloatTerminal, {})
vim.api.nvim_create_user_command("TerminalSplit", openSplitTerminal, {})
