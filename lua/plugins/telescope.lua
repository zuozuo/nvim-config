return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require("telescope.actions")
    require('telescope').setup{
      defaults = {
        theme = "dropdown",
        layout_strategy='vertical',
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
        },
        tags = {
          theme = "dropdown",
          ctags_file = ".ctags",  -- Optional: ctags file path
          -- 1. **`tags_file`**: Specifies the default tags file path (usually `tags` in the project root).
          -- 2. **`ctags_file`**: Optional configuration for ctags file path.
          ctags_args = { "--exclude=node_modules", "--exclude=vendor" },  -- Optional: ctags arguments
          only_sort = false,  -- Allow searching and sorting
          show_line = true,   -- Show the line where the tag is found
          previewer = true,   -- Enable previewer
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
