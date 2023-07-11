return {
  'michaelb/sniprun',
  build = 'sh ./install.sh 1',
  config = function()
    require('sniprun').setup({
      binary_path = '~/.config/sniprun'
    })
  end
}
