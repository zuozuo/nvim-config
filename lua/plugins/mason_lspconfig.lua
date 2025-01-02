-- Mason 和 LSP 配置桥接插件，自动安装和配置语言服务器
return {
  lazy = true,
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { "pyright", "pylsp", "lua_ls" },
    }
  end
}
