-- this function only support run python code now
-- TODO: add support to run more languages
local function runCurrentFile()
  vim.notify = require("notify")
  local file = vim.api.nvim_buf_get_name(0)
  if (file == "") then
    vim.notify("No file to execute", "warn")
    return
  end

  local ft = vim.bo.filetype

  if (ft == "http") then
    require('rest-nvim').run()
  end

  if (ft == "markdown") then
    if (string.find(file, ".config/nvim/prompts/conversation_")) then
      local cmd =
      "FloatermNew! --height=0.95 --width=0.99 --autoclose=2 --cwd=~/workspace/workstream/chatbot " ..
      "conda activate chatbot && python ~/.config/nvim/python/chatgpt.py"
      vim.cmd(cmd)
    else
      local cmd = "FloatermNew! --wintype=float --height=0.95 --width=0.7 glow " .. file
      vim.cmd(cmd)
    end
    return
  end

  if (ft == "yaml") then
    local cmd =
        "FloatermNew! --wintype=float --height=0.95 --position=bottom --width=0.99 " ..
        "python manage.py test_chat --logging=true --path=" .. file
    -- print(cmd)
    vim.cmd(cmd)
    return
  end

  local execs = {
    python = "python",
    lua = "lua",
  }
  if execs[ft] then
    local executable = vim.fn.exepath(execs[ft])
    local cmd = "FloatermNew " .. executable .. " % && exit 1"
    print(cmd)
    vim.cmd(cmd)
  else
    vim.notify(ft .. "Not support to execute in the command", "warn")
  end
end

vim.api.nvim_create_user_command("RunCurrentFile", runCurrentFile, {})
vim.keymap.set('n', '<leader>sr', '<cmd>RunCurrentFile<CR>')

------------------------------------------------------------------------------------------
----------------------------- map CMD+R to ,sr in iterm 2 --------------------------------
------------------------------------------------------------------------------------------
