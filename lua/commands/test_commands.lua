vim.api.nvim_create_user_command("Playground", function(opts)
  -- vim.ui.input({ prompt = 'Enter value for shiftwidth: ' }, function(input)
  --   vim.o.shiftwidth = tonumber(input)
  -- end)

  vim.ui.select({'apple', 'banana', 'mango'}, {
    prompt = "Title",
    telescope = require("telescope.themes").get_cursor(),
    dd(telescope)
  }, function(selected)
      dd(selected)
    end)
end, {})
