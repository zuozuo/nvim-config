-- 模糊查找插件，提供强大的文件、内容搜索功能
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  -- lazy = true,
  config = function()
    local actions = require("telescope.actions")
    require('telescope').setup{
      defaults = {
        theme = "dropdown",
        layout_strategy='vertical',
        mappings = {
          i = {
            ["?"] = "which_key",
            ["<esc>"] = actions.close,
            ["<C-t>"] = actions.select_tab,   -- 在新标签页中打开
            ['<C-s>'] = actions.select_vertical,
            ['<C-x>'] = actions.select_vertical,
            ['<C-v>'] = actions.select_horizontal,
            ["<C-e>"] = actions.send_to_qflist, -- 发送到 Quickfix 列表
            ["<C-j>"] = actions.move_selection_next, -- 下一个结果
            ["<C-k>"] = actions.move_selection_previous, -- 上一个结果
          },
          n = {
            ["?"] = "which_key",
            ["<esc>"] = actions.close,
            ["<C-t>"] = actions.select_tab,   -- 在新标签页中打开
            ['<C-s>'] = actions.select_vertical,
            ['<C-x>'] = actions.select_vertical,
            ['<C-v>'] = actions.select_horizontal,
            ["<C-e>"] = actions.send_to_qflist, -- 发送到 Quickfix 列表
            ["<C-j>"] = actions.move_selection_next, -- 下一个结果
            ["<C-k>"] = actions.move_selection_previous, -- 上一个结果
            ["j"] = actions.move_selection_next, -- 下一个结果
            ["k"] = actions.move_selection_previous, -- 上一个结果
          },
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
