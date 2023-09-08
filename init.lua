-- ========================================================================== --
-- ==                       load configs and plugins                       == --
-- ========================================================================== --

local requireAll = require("require_all")

require("settings")
require("lazy_config")
require("keymaps")
requireAll("commands")

-- vim.cmd("colorscheme desert")
vim.cmd("colorscheme sonokai")
vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("colorscheme catppuccin-macchiato")
vim.diagnostic.disable()
