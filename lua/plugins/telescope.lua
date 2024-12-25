return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require("telescope.actions")
    require('telescope').setup{
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<esc>"] = actions.close,
          }
        }
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          -- find_command = {"ag", "--silent", "--nocolor", "--follow", "-g", "", "--literal", "--hidden","--ignore", ".git "},
          find_command = {"fd", "--type", "f", "--hidden", "--exclude", ".git", "--exclude", "node_modules", "--exclude", "vendor", },
        }
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      }
    }
  end
}
