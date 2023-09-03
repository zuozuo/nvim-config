-- ========================================================================== --
-- ==                       load configs and plugins                       == --
-- ========================================================================== --

local requireAll = function(name)
  local config = vim.fn.stdpath('config')
  for _, file in ipairs(vim.fn.readdir(config .. '/lua/' .. name, [[v:val =~ '\.lua$']])) do
    require(name .. '.' .. file:gsub('%.lua$', ''))
  end
end
require("settings")
require("lazy_config")
require("keymaps")
requireAll("commands")

-- vim.cmd("colorscheme desert")
vim.cmd("colorscheme sonokai")
vim.diagnostic.disable()
