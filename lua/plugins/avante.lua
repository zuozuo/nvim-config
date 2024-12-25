return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- add any opts here
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | [string]
    -- provider = "claude", -- Recommend using Claude
    -- -- auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    -- ------------------------------ not working --------------------------------------------
    -- claude = {
    --   endpoint = "https://api.gptsapi.net",
    --   model = "claude-3-5-sonnet-20241022",
    --   temperature = 0,
    --   max_tokens = 4096,
    -- },
    -- provider = "openai", -- Only recommend using Claude
    -- openai = {
    --   endpoint = "http://0.0.0.0:4000/v1",
    --   model = "claude-3",
    --   timeout = 20000, -- Timeout in milliseconds
    --   temperature = 0,
    --   max_tokens = 4096,
    -- },
    provider = "openai", -- Only recommend using Claude
    openai = {
      endpoint = "https://api.gptsapi.net/v1",
      model = "gpt-4o",
      timeout = 20000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 4096,
    },
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
    },
    -- auto_suggestions_provider = "azure",
    -- azure = {
    --   endpoint = "https://zuozuo-je1.openai.azure.com/", -- example: "https://<your-resource-name>.openai.azure.com"
    --   deployment = "gpt-4o", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
    --   api_version = "2024-08-01-preview",
    --   timeout = 30000, -- Timeout in milliseconds
    --   temperature = 0,
    --   max_tokens = 4096,
    --   ["local"] = false,
    -- }
    -- provider = "claude", -- Recommend using Claude
    -- auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    -- claude = {
    --   endpoint = "https://api.gptsapi.net",
    --   model = "claude-3-5-sonnet-20241022",
    --   temperature = 0,
    --   max_tokens = 4096,
    -- },
    -- provider = "my-custom-provider", -- You can then change this provider here
    -- vendors = {
    --   ["my-custom-provider"] = {
    --     endpoint = "http://localhost:8000/v1/chat/completions", -- The full endpoint of the provider
    --     model = "qweb25-coder", -- The model name to use with this provider
    --     api_key_name = "", -- The name of the environment variable that contains the API key
    --     --- This function below will be used to parse in cURL arguments.
    --     --- It takes in the provider options as the first argument, followed by code_opts retrieved from given buffer.
    --     --- This code_opts include:
    --     --- - question: Input from the users
    --     --- - code_lang: the language of given code buffer
    --     --- - code_content: content of code buffer
    --     --- - selected_code_content: (optional) If given code content is selected in visual mode as context.
    --     ---@type fun(opts: AvanteProvider, code_opts: AvantePromptOptions): AvanteCurlOutput
    --     parse_curl_args = function(opts, code_opts) end,
    --     --- This function will be used to parse incoming SSE stream
    --     --- It takes in the data stream as the first argument, followed by SSE event state, and opts
    --     --- retrieved from given buffer.
    --     --- This opts include:
    --     --- - on_chunk: (fun(chunk: string): any) this is invoked on parsing correct delta chunk
    --     --- - on_complete: (fun(err: string|nil): any) this is invoked on either complete call or error chunk
    --     ---@type fun(data_stream: string, event_state: string, opts: ResponseParser): nil
    --     parse_response = function(data_stream, event_state, opts) end,
    --     --- The following function SHOULD only be used when providers doesn't follow SSE spec [ADVANCED]
    --     --- this is mutually exclusive with parse_response_data
    --     ---@type fun(data: string, handler_opts: AvanteHandlerOptions): nil
    --     parse_stream_data = function(data, handler_opts) end,
    --   },
    -- },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",      -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
