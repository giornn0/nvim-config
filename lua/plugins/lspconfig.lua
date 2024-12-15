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
    source = true, -- Or "if_many"
  },
  signs = true,
  severity_sort = true,
})
--INFO: This cmd is related to where you install your npm packages globally.
--For this we need to install @angular-language-server + typescript.
local angular_cmd = {
  "ngserver",
  "--ngProbeLocations",
  "./",
  "--tsProbeLocations",
  "./",
  "--stdio",
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.tbl_extend("force", opts.servers, {
        biome = {},
        postgres_lsp = {},
        graphql = {},
        angularls = {
          cmd = angular_cmd,
          on_new_config = function(new_config, new_root_dir)
            new_config.cmd = angular_cmd
          end,
        },
        tailwindcss = tailwindcss,
        html = {
          filetypes = { "html", "templ", "heex", "htmlangular" },
        },
        svelte = {
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
          capabilities = {
            workspace = {
              didChangeWatchedFiles = vim.fn.has("nvim-0.10") == 0 and { dynamicRegistration = true },
            },
          },
        },
        cssls = {},
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
        "graphql",
        "css",
        "scss",
        "angular",
        "svelte",
      })
    end,
  },
}
