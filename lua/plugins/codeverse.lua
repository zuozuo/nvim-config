return {
    "git@code.byted.org:chenjiaqi.cposture/codeverse.vim.git",
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeverse").setup({
        })
    end
}
