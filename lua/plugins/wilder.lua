return {
  'gelguy/wilder.nvim',
  config = function()
    -- config goes here
    require('wilder').setup({
      modes = {'/', '?'}
    })
  end,
}
