return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      ui = {
        code_action = ''
      },
      outline = {
        layout = 'normal',
      },
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  },
}
