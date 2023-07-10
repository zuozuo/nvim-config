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
      vim.keymap.set('n', '?', api.tree.toggle_help,                  opts('Help'))
    end


    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        on_attach = my_on_attach,
        view = {
          width = 30,
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