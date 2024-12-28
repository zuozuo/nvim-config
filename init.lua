-- ========================================================================== --
-- ==                       load configs and plugins                       == --
-- ========================================================================== --

local requireAll = require("require_all")

require("settings")
require("lazy_config")

vim.cmd("colorscheme delek")
vim.cmd("colorscheme desert")
vim.cmd("colorscheme sonokai")
vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("colorscheme catppuccin-macchiato")
vim.diagnostic.disable()

requireAll("commands")

require("keymaps")

if vim.fn.getenv("ITERM_SESSION_ID") ~= vim.NIL then
  require("keymaps_iterm2")
  print("Running in iTerm2")
end

-- 使用 kitty 终端特性
if vim.env.TERM == 'xterm-kitty' then
  vim.opt.mouse = 'a'
  require("keymaps_kitty")
  print("Running in Kitty")
end

