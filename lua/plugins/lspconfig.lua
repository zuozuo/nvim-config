return {
  "neovim/nvim-lspconfig", 
  config = function()
    local lspconfig = require('lspconfig')
    -- lspconfig.pyright.setup{}
    -- lspconfig.ruff_lsp.setup{}
    lspconfig.pylsp.setup{
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = {'W391'},
              maxLineLength = 100
            }
          }
        }
      }
    }
  end
}
