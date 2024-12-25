-- Configuration Commands
vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {})                                    -- Reload Neovim configuration
vim.api.nvim_create_user_command("EditConfigVim", "edit ~/.config/nvim/init.vim", {})                      -- Edit Vim config file
vim.api.nvim_create_user_command("EditConfig", "edit ~/.config/nvim/init.lua", {})                         -- Edit Lua config file
vim.api.nvim_create_user_command("EditConfigLua", "edit ~/.config/nvim/lua/", {})                          -- Edit Lua config directory

-- Git Commands
vim.api.nvim_create_user_command("Blame", "Gitsigns toggle_current_line_blame", {})                        -- Toggle git blame
vim.api.nvim_create_user_command("BLame", "Gitsigns toggle_current_line_blame", {})                        -- Alternative git blame
vim.api.nvim_create_user_command("GitStatus",                                                              -- Show git status
  "lua require('telescope.builtin').git_status({layout_strategy='vertical',layout_config={width=0.6}})", {})

-- File Navigation
vim.api.nvim_create_user_command("FindFile", "NvimTreeFocus", {})                                         -- Focus file tree
vim.api.nvim_create_user_command("ClearBuffers", "bufdo bd", {})                                          -- Close all buffers

-- Python & Django Commands
vim.api.nvim_create_user_command("FormatPython", ":w | !black %:p", {})                                   -- Format Python file
vim.api.nvim_create_user_command("FOrmatPython", ":w | !black %:p", {})                                   -- Alternative format
vim.api.nvim_create_user_command("DjangoServer", "FloatermNew python manage.py runserver", {})             -- Start Django server
vim.api.nvim_create_user_command("DJangoConsole",                                                          -- Django shell plus
  "FloatermNew --name=ipython --wintype=vsplit --width=0.5 python manage.py shell_plus --ipython", {})
vim.api.nvim_create_user_command("DjangoConsole",                                                          -- Alternative Django shell
  "FloatermNew --name=ipython --wintype=vsplit --width=0.5 python manage.py shell_plus --ipython", {})

-- Diagnostic Commands
vim.api.nvim_create_user_command("DiagnoseTelescope", "Telescope diagnostics theme=dropdown", {})          -- Show diagnostics in Telescope
vim.api.nvim_create_user_command("Diagnose", "lua vim.diagnostic.setloclist()", {})                        -- Set diagnostic location list
vim.api.nvim_create_user_command("DiagnoseCurrentFile", "lua vim.diagnostic.setloclist()", {})             -- Current file diagnostics
vim.api.nvim_create_user_command("DiagnoseAll", "lua vim.diagnostic.setqflist()", {})                      -- All diagnostics
vim.api.nvim_create_user_command("DiagnoseShow", "lua vim.diagnostic.show()", {})                          -- Show diagnostics
vim.api.nvim_create_user_command("DiagnoseHide", "lua vim.diagnostic.hide()", {})                          -- Hide diagnostics

-- LSP Commands
vim.api.nvim_create_user_command("References", "lua vim.lsp.buf.references()", {})                         -- Show references
vim.api.nvim_create_user_command("Format", "lua vim.lsp.buf.format()", {})                                -- Format buffer
vim.api.nvim_create_user_command("Implementation", "lua vim.lsp.buf.implementation()", {})                 -- Show implementation
vim.api.nvim_create_user_command("Rename", "Lspsaga rename", {})                                          -- Rename symbol
vim.api.nvim_create_user_command("REname", "Lspsaga rename", {})                                          -- Alternative rename
vim.api.nvim_create_user_command("RRR", "Lspsaga rename", {})                                             -- Quick rename
vim.api.nvim_create_user_command("Finder", "Lspsaga finder", {})                                          -- LSP finder
vim.api.nvim_create_user_command("FFF", "Lspsaga finder", {})                                             -- Quick LSP finder

-- Terminal & Tools
vim.api.nvim_create_user_command("Ipython", "FloatermNew --name=ipython ipython", {})                     -- Open IPython terminal
vim.api.nvim_create_user_command("IPython", "FloatermNew --name=ipython ipython", {})                     -- Alternative IPython
vim.api.nvim_create_user_command("A", "FloatermNew --wintype=vsplit --width=0.3 aider --watch", {})       -- Open Aider AI assistant
vim.api.nvim_create_user_command("Ai", "FloatermNew --wintype=vsplit --width=0.3 aider --watch", {})       -- Open Aider AI assistant
vim.api.nvim_create_user_command("Y", "FloatermNew --width=0.99 --height=0.99 yazi", {})                  -- Open Yazi file manager
vim.api.nvim_create_user_command("Send", "FloatermSend", {})                                              -- Send to terminal

-- Utility Commands
vim.api.nvim_create_user_command("SnippetPython", "sp ~/.config/nvim/snippets/python/custom.json", {})     -- Edit Python snippets
vim.api.nvim_create_user_command("Ctags", "!ctags -R --fields='+n' -f .tags", {})                         -- Generate ctags
vim.api.nvim_create_user_command("RemoveSwp", "!rm -rf ~/.local/state/nvim/swap/*", {})                   -- Remove swap files
vim.api.nvim_create_user_command("PromptsFind", "Telescope find_files theme=dropdown cwd=~/.config/nvim/prompts", {}) -- Find prompts
vim.api.nvim_create_user_command("PromptsGrep", "Telescope live_grep theme=dropdown cwd=~/.config/nvim/prompts", {})  -- Search prompts
vim.api.nvim_create_user_command("Http", "lua require('rest-nvim').run()", {})                            -- Run HTTP request
