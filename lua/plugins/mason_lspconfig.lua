return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { "pyright", "pylsp", "lua_ls" },
    }
  end
}
