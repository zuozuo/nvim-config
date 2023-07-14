return {
  "https://git.sr.ht/~nedia/auto-save.nvim",
  event = "BufWinEnter",
  config = function()
    require("auto-save").setup({
      events = { "InsertLeave", "BufLeave" },
      exclude_ft = { "neo-tree" },
    })
  end
}
