-- ========================================================================== --
-- ==                             useful links                             == --
-- ========================================================================== --

-- https://www.physics.udel.edu/~watson/scen103/ascii.html
-- https://codeberg.org/emi/nvim-config
-- https://www.windmill.co.uk/ascii-control-codes.html
-- https://superuser.com/questions/387897/can-i-use-the-cmd-key-in-terminal-vim-at-all
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- https://github.com/VonHeikemen/nvim-starter/tree/01-base



-- ========================================================================== --
-- ==                       load configs and plugins                       == --
-- ========================================================================== --

require("settings")
require("lazy_config")
require("keymaps")
require("commands")

-- vim.cmd("colorscheme desert")
vim.cmd("colorscheme sonokai")
