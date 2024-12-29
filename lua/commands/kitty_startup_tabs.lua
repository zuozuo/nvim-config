-- 添加一个新的模块来存放我们的函数
local M = {}

-- 定义主函数
local kittyStartupTabs = function()
  local cmd = string.format(
    "FloatermNew --exit_all=1 kittytabs"
  )
  vim.cmd(cmd)
end

-- 创建命令
vim.api.nvim_create_user_command("KittyStartupTabs", kittyStartupTabs, {})

-- 导出模块
return M
