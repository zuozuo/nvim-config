-- 快速选择插件，提供高效的文件和内容选择功能
return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.pick').setup()
  end
}
