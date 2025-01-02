-- LSP 配置插件，提供语言服务器协议支持
return {
  lazy = true,
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup{}
    lspconfig.ts_ls.setup{
      -- filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx", "lua" }
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

    --Enable (broadcasting) snippet capability for completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.cssls.setup {
      capabilities = capabilities,
    }
  end
}
