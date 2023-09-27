return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup{}
    lspconfig.tsserver.setup{
      filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" }
    }
    lspconfig.gopls.setup{}
    -- lspconfig.ruff_lsp.setup{}
    lspconfig.lua_ls.setup{
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    }
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
