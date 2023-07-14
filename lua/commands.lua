vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {})
vim.api.nvim_create_user_command("EditConfigVim", "edit ~/.config/nvim/init.vim", {})
vim.api.nvim_create_user_command("EditConfig", "edit ~/.config/nvim/init.lua", {})
vim.api.nvim_create_user_command("EditConfigLua", "edit ~/.config/nvim/lua/", {})
vim.api.nvim_create_user_command("Blame", "Gitsigns toggle_current_line_blame", {})
vim.api.nvim_create_user_command("FindFile", "NvimTreeFocus", {})
vim.api.nvim_create_user_command("Ttt", "FloatermToggle zsh", {})
vim.api.nvim_create_user_command("FormatPython", ":w | !black %:p", {})
vim.api.nvim_create_user_command("GitStatus", "lua require('telescope.builtin').git_status({layout_strategy='vertical',layout_config={width=0.6}})", {})
vim.api.nvim_create_user_command("DiagnoseTelescope", "Telescope diagnostics theme=dropdown", {})
vim.api.nvim_create_user_command("Diagnose", "lua vim.diagnostic.setloclist()", {})
vim.api.nvim_create_user_command("DiagnoseCurrentFile", "lua vim.diagnostic.setloclist()", {})
vim.api.nvim_create_user_command("DiagnoseAll", "lua vim.diagnostic.setqflist()", {})
vim.api.nvim_create_user_command("DiagnoseShow", "lua vim.diagnostic.show()", {})
vim.api.nvim_create_user_command("DiagnoseHide", "lua vim.diagnostic.hide()", {})
vim.api.nvim_create_user_command("SnippetPython", "sp ~/.config/nvim/snippets/python/custom.json", {})
vim.api.nvim_create_user_command("Ctags", "!ctags -R --fields='+n' -f .tags", {})
vim.api.nvim_create_user_command("ClearBuffers", "bufdo bd", {})
vim.api.nvim_create_user_command("Send", "FloatermSend", {})
vim.api.nvim_create_user_command("DjangoConsole", "FloatermNew --name=ipython --wintype=vsplit --width=0.4 python manage.py shell -i ipython", {})

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

local closeAllFloatingWindows = function()
  for a=0,20 do
    local result = vim.api.nvim_exec("FloatermKill", true)
    if(result ~= "") then
      print("Successfully closed " .. a .. " floating windows")
      break
    end
  end
end
vim.api.nvim_create_user_command("CloseAllFloatingWindows", closeAllFloatingWindows, {})

-- this function only support run python code now
-- TODO: add support to run more languages
local function runCurrentFile()
  vim.notify = require("notify")
  local file = vim.api.nvim_buf_get_name(0)
  if(file == "") then
    vim.notify("No file to execute", "warn")
    return
  end

  local ft = vim.bo.filetype
  local execs = {
    python = "python",
    markdown = "grip",
    lua = "lua",
  }
  if execs[ft] then
    local executable = vim.fn.exepath(execs[ft])
    local cmd = "FloatermNew " .. executable.. " % && exit 1"
    print(cmd)
    vim.cmd(cmd)
  else
    vim.notify(ft .. "Not support to execute in the command", "warn")
  end
end
vim.api.nvim_create_user_command("RunCurrentFile", runCurrentFile, {})









-- https://www.reddit.com/r/neovim/comments/xhtr1p/nvim_autocmd_filetype_option/
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   desc = 'format python on write using black',

--   group = vim.api.nvim_create_augroup('black_on_save', { clear = true }),
--   callback = function (opts)
--     if vim.bo[opts.buf].filetype == 'python' then
--       vim.cmd 'FormatPython'
--     end
--   end,
-- })
