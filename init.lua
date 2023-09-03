-- ========================================================================== --
-- ==                       load configs and plugins                       == --
-- ========================================================================== --

local requireAll = require("require_all")

require("settings")
require("lazy_config")
require("keymaps")
-- requireAll("commands")

-- vim.cmd("colorscheme desert")
vim.cmd("colorscheme sonokai")
vim.diagnostic.disable()

local chatGPT = function()
  requireAll("commands")
end
vim.api.nvim_create_user_command("GPT", chatGPT, {})
