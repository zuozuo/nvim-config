-- 自动检测缩进插件，根据文件内容自动设置缩进，支持多种文件类型
return {
  lazy = true,
  'nmac427/guess-indent.nvim',
  config = function()
    require('guess-indent').setup({})
  end
}
