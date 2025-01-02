-- 命令补全增强插件，提供更智能的命令补全功能
return {
  lazy = true,
  'gelguy/wilder.nvim',
  config = function()
    -- config goes here
    require('wilder').setup({
      modes = {'/', '?'}
    })
  end,
}
