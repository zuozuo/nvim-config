vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {})
vim.api.nvim_create_user_command("EditConfigVim", "edit ~/.config/nvim/init.vim", {})
vim.api.nvim_create_user_command("EditConfig", "edit ~/.config/nvim/init.lua", {})
vim.api.nvim_create_user_command("EditConfigLua", "edit ~/.config/nvim/lua/", {})
vim.api.nvim_create_user_command("Blame", "Gitsigns toggle_current_line_blame", {})
vim.api.nvim_create_user_command("BLame", "Gitsigns toggle_current_line_blame", {})
vim.api.nvim_create_user_command("FindFile", "NvimTreeFocus", {})
vim.api.nvim_create_user_command("Ttt", "FloatermToggle zsh", {})
vim.api.nvim_create_user_command("FormatPython", ":w | !black %:p", {})
vim.api.nvim_create_user_command("FOrmatPython", ":w | !black %:p", {})
vim.api.nvim_create_user_command("GitStatus",
  "lua require('telescope.builtin').git_status({layout_strategy='vertical',layout_config={width=0.6}})", {})
vim.api.nvim_create_user_command("DiagnoseTelescope", "Telescope diagnostics theme=dropdown", {})
vim.api.nvim_create_user_command("Diagnose", "lua vim.diagnostic.setloclist()", {})
vim.api.nvim_create_user_command("DiagnoseCurrentFile", "lua vim.diagnostic.setloclist()", {})
vim.api.nvim_create_user_command("DiagnoseAll", "lua vim.diagnostic.setqflist()", {})
vim.api.nvim_create_user_command("DiagnoseShow", "lua vim.diagnostic.show()", {})
vim.api.nvim_create_user_command("DiagnoseHide", "lua vim.diagnostic.hide()", {})
vim.api.nvim_create_user_command("SnippetPython", "sp ~/.config/nvim/snippets/python/custom.json", {})
vim.api.nvim_create_user_command("Ctags", "!ctags -R --fields='+n' -f .tags", {})
vim.api.nvim_create_user_command("ClearBuffers", "bufdo bd", {})
vim.api.nvim_create_user_command("Send", "FloatermSend", {})
vim.api.nvim_create_user_command("References", "lua vim.lsp.buf.references()", {})
vim.api.nvim_create_user_command("Format", "lua vim.lsp.buf.format()", {})
vim.api.nvim_create_user_command("Implementation", "lua vim.lsp.buf.implementation()", {})
vim.api.nvim_create_user_command("DjangoServer", "FloatermNew python manage.py runserver", {})
vim.api.nvim_create_user_command("DjangoConsole",
  "FloatermNew --name=ipython --wintype=vsplit --width=0.5 python manage.py shell_plus --ipython", {})
vim.api.nvim_create_user_command("RemoveSwp", "!rm -rf ~/.local/state/nvim/swap/*", {})
