-- 字节跳动内部代码辅助插件，提供代码质量检查和优化建议
return {
    lazy = true,
    "git@code.byted.org:chenjiaqi.cposture/codeverse.vim.git",
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeverse").setup({
        })
    end
}
