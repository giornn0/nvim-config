local protocol = require("vim.lsp.protocol")
local tailwindcss = require("config.tailwindcss")

protocol.CompletionItemKind = {
  "", -- Text
  "", -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}
-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = true,
  -- update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
  signs = true,
  severity_sort = true,
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.tbl_extend("force", opts.servers, {
        tsserver = {
          on_attach = function(client)
            -- this is important, otherwise tsserver will format ts/js
            -- files which we *really* don't want.
            client.server_capabilities.documentFormattingProvider = false
          end,
        },
        biome = {},
        postgres_lsp = {},
        nil_ls = {},
        graphql = {},
        zls = {},
        intelephense = {},
        gleam = {},
        tailwindcss = tailwindcss,
      })
      return opts
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls").builtins
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.formatting.alejandra,
        nls.formatting.pretty_php,
        nls.formatting.pg_format,
        -- nls.formatting.biome.with({
        --   args = {
        --     "check",
        --     "--apply-unsafe",
        --     "--formatter-enabled=true",
        --     "--organize-imports-enabled=true",
        --     "--skip-errors",
        --     "$FILENAME",
        --   },
        -- }),
      })
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      opts.ignore_install = { "python" }
      vim.list_extend(opts.ensure_installed, {
        "sql",
        "nix",
        "graphql",
        "zig",
        "php",
      })
    end,
  },
}
