return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', 'C', api.tree.change_root_to_node,        opts('Change root to current node'))
      vim.keymap.set('n', 'a', api.fs.create,        opts('Create file or dir, use trailing slash for a dir'))
      vim.keymap.set('n', 'v', api.node.open.vertical,        opts('Open file in a new vertical split'))
      vim.keymap.set('n', 's', api.node.open.horizontal,        opts('Open file in a new horizontal split'))
      vim.keymap.set('n', '?', api.tree.toggle_help,                  opts('Help'))
    end


    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        on_attach = my_on_attach,
        view = {
          width = 30,
        },
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "rounded",
            width = 30,
            height = 30,
            row = 1,
            col = 1,
          },
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false,
              modified = false,
            }
          }
        },
        filters = {
          dotfiles = true,
        },
      })
  end
}
