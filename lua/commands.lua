vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {})
vim.api.nvim_create_user_command("EditConfigVim", "edit ~/.config/nvim/init.vim", {})
vim.api.nvim_create_user_command("EditConfig", "edit ~/.config/nvim/lua/init.lua", {})
vim.api.nvim_create_user_command("EditConfigLua", "edit ~/.config/nvim/lua/", {})
vim.api.nvim_create_user_command("Blame", "Gitsigns toggle_current_line_blame", {})
vim.api.nvim_create_user_command("FindFile", "NvimTreeFocus", {})
vim.api.nvim_create_user_command("Ttt", "belowright split | terminal", {})
vim.api.nvim_create_user_command("FormatPython", ":w | !black %:p", {})
vim.api.nvim_create_user_command("GitStatus", "lua require('telescope.builtin').git_status({layout_strategy='vertical',layout_config={width=0.6}})", {})
vim.api.nvim_create_user_command("Diagnose", "Telescope diagnostics theme=dropdown", {})
vim.api.nvim_create_user_command("DiagnoseShow", "lua vim.diagnostic.show()", {})
vim.api.nvim_create_user_command("DiagnoseHide", "lua vim.diagnostic.hide()", {})
vim.api.nvim_create_user_command("SnippetPython", "sp ~/.config/nvim/snippets/custom.json", {})
vim.api.nvim_create_user_command("Ctags", "!ctags -R --fields='+n' -f .tags", {})
vim.api.nvim_create_user_command("ClearBuffers", "bufdo bd", {})

-- https://www.reddit.com/r/neovim/comments/xhtr1p/nvim_autocmd_filetype_option/
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   desc = 'format python on write using black',

--   group = vim.api.nvim_create_augroup('black_on_save', { clear = true }),
--   callback = function (opts)
--     if vim.bo[opts.buf].filetype == 'python' then
--       vim.cmd 'FormatPython'
--     end
--   end,
-- })
