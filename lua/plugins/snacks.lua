return {
  lazy = true,
  "folke/snacks.nvim",
  priority = 1000,
  lazy = true,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = false },
    quickfile = { enabled = true },
    dashboard = { enabled = false },
    indent = { enabled = false },
    input = { enabled = true },
    toggle = { enabled = false },
    profiler = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    dim = {
      enabled = true,
      scope = {
        min_size = 60,
        max_size = 80,
        siblings = true,
      },
    },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      input = {
        relative = "editor",
        row = 0,
        col = 0,
      }
    },
    scope = {
      enable = true,
      ---@class snacks.scope.Config
      ---@field max_size? number
      ---@field enabled? boolean
      -- absolute minimum size of the scope.
      -- can be less if the scope is a top-level single line scope
      min_size = 2,
      -- try to expand the scope to this size
      max_size = nil,
      cursor = true, -- when true, the column of the cursor is used to determine the scope
      edge = true, -- include the edge of the scope (typically the line above and below with smaller indent)
      siblings = false, -- expand single line scopes with single line siblings
      -- what buffers to attach to
      filter = function(buf)
        return vim.bo[buf].buftype == ""
      end,
      -- debounce scope detection in ms
      debounce = 30,
      treesitter = {
        -- detect scope based on treesitter.
        -- falls back to indent based detection if not available
        enabled = true,
        ---@type string[]|{enabled?:boolean}
        blocks = {
          enabled = true, -- enable to use the following blocks
          "function_declaration",
          "function_definition",
          "method_declaration",
          "method_definition",
          "class_declaration",
          "class_definition",
          "do_statement",
          "while_statement",
          "repeat_statement",
          "if_statement",
          "for_statement",
        },
        -- these treesitter fields will be considered as blocks
        field_blocks = {
          "local_declaration",
        },
      },
      -- These keymaps will only be set if the `scope` plugin is enabled.
      -- Alternatively, you can set them manually in your config,
      -- using the `Snacks.scope.textobject` and `Snacks.scope.jump` functions.
      keys = {
        ---@type table<string, snacks.scope.TextObject|{desc?:string}>
        textobject = {
          ii = {
            min_size = 2, -- minimum size of the scope
            edge = false, -- inner scope
            cursor = false,
            treesitter = { blocks = { enabled = false } },
            desc = "inner scope",
          },
          ai = {
            cursor = false,
            min_size = 2, -- minimum size of the scope
            treesitter = { blocks = { enabled = false } },
            desc = "full scope",
          },
        },
        ---@type table<string, snacks.scope.Jump|{desc?:string}>
        jump = {
          ["[i"] = {
            min_size = 1, -- allow single line scopes
            bottom = false,
            cursor = false,
            edge = true,
            treesitter = { blocks = { enabled = false } },
            desc = "jump to top edge of scope",
          },
          ["]i"] = {
            min_size = 1, -- allow single line scopes
            bottom = true,
            cursor = false,
            edge = true,
            treesitter = { blocks = { enabled = false } },
            desc = "jump to bottom edge of scope",
          },
        },
      },
    }
  },
  keys = {
    -- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    -- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    -- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    -- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    -- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    -- { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    -- { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    -- { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    -- { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    -- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    -- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    -- {
    --   "<leader>N",
    --   desc = "Neovim News",
    --   function()
    --     Snacks.win({
    --       file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    --       width = 0.6,
    --       height = 0.6,
    --       wo = {
    --         spell = false,
    --         wrap = false,
    --         signcolumn = "yes",
    --         statuscolumn = " ",
    --         conceallevel = 3,
    --       },
    --     })
    --   end,
    -- }
  },
  init = function()
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "VeryLazy",
    --   callback = function()
    --     -- Setup some globals for debugging (lazy-loaded)
    --     _G.dd = function(...)
    --       Snacks.debug.inspect(...)
    --     end
    --     _G.bt = function()
    --       Snacks.debug.backtrace()
    --     end
    --     vim.print = _G.dd -- Override print to use snacks for `:=` command

    --     -- Create some toggle mappings
    --     Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    --     Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    --     Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    --     Snacks.toggle.diagnostics():map("<leader>ud")
    --     Snacks.toggle.line_number():map("<leader>ul")
    --     Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
    --     Snacks.toggle.treesitter():map("<leader>uT")
    --     Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    --     Snacks.toggle.inlay_hints():map("<leader>uh")
    --     Snacks.toggle.indent():map("<leader>ug")
    --     Snacks.toggle.dim():map("<leader>uD")
    --   end,
    -- })
  end,
}
