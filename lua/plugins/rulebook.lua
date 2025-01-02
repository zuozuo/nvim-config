-- return {
--     "git@code.byted.org:chenjiaqi.cposture/codeverse.vim.git",
--     dependencies = {
--         "hrsh7th/nvim-cmp",
--     },
--     config = function()
--         require("codeverse").setup({
--         })
--     end
-- }

return {
  -- "chrisgrieser/nvim-rulebook",
  -- config = function()
  --   require("rulebook").setup = ({
  --     -- if no diagnostic is found in current line, search this many lines forward
  --     forwSearchLines = 10,

  --     ignoreComments = {
  --       shellcheck = {
  --         comment = "# shellcheck disable=%s",
  --         location = "prevLine",
  --         multiRuleIgnore = true,
  --         multiRuleSeparator = ",",
  --       },
  --       -- ... (full list of sources with builtin support can be found in the README)

  --       yourCustomSource = { -- exact, case-sensitive source-name
  --         -- `%s` will be replaced with rule-id
  --         comment = "// disabling-comment %s",

  --         ---@type "prevLine"|"sameLine"|"encloseLine"
  --         location = "sameLine",

  --         -- whether multiple rules can be ignored with one comment, defaults to `false`
  --         multiRuleIgnore = true,

  --         -- separator for multiple rule-ids, defaults to ", "
  --         multiRuleSeparator = ",",
  --       },

  --       -- if location is "encloseLine", needs to be a list of two strings
  --       anotherCustomSource = {
  --         comment = { 
  --           "// disable-rule %s", 
  --           "// enable-rule %s",
  --         },
  --         location = "encloseLine",
  --       }
  --     },

  --     ruleDocs = {
  --       selene = "https://kampfkarren.github.io/selene/lints/%s.html",
  --       -- ... (full list of supported sources can be found in the README)

  --       -- Search URL when no documentation definition is available for a
  --       -- diagnostic source. `%s` will be replaced with the diagnostic source & code.
  --       -- Default is the DDG "Ducky Search" (automatically opening first result).
  --       fallback = "https://duckduckgo.com/?q=%s+%%21ducky&kl=en-us",

  --       -- the value of the rule documentations accept either a string or a function
  --       -- * if a string, `%s` will be replaced with rule-id
  --       -- * if a function, takes a `:h diagnostic-structure` as argument & return a url
  --       yourCustomSource = "https://my-docs/%s.hthml",
  --       anotherCustomSource = function(diag)
  --         -- ...
  --         return url
  --       end,
  --     },

  --     suppressFormatter = {
  --       lua = {
  --         -- normal mode
  --         ignoreBlock = "-- stylua: ignore",
  --         location = "prevLine",

  --         -- visual mode
  --         ignoreRange = { "-- stylua: ignore start", "-- stylua: ignore start" },
  --       },
  --     }
  --   })
  -- end
}
