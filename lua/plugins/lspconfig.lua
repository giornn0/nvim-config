local protocol = require("vim.lsp.protocol")
local angular = require("config.angular")
local elixir = require("config.elixir")
local svelte = require("config.svelte")
local tailwindcss = require("config.tailwindcss")
local nginx = require("config.nginx")

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
    source = true, -- Or "if_many"
  },
  signs = true,
  severity_sort = true,
})

vim.filetype.add({
  pattern = {
    [".conf"] = "nginx",
  },
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.tbl_extend("force", opts.servers, {
        angularls = angular,
        tailwindcss = tailwindcss,
        html = {
          filetypes = { "html", "templ", "htmlangular" },
        },
        svelte = svelte,
        cssls = {},
        elixirls = elixir,
        nginx_language_server = nginx,
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
        "css",
        "scss",
        "angular",
        "svelte",
        "nginx",
      })
    end,
  },
}
