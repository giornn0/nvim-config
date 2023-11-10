local general = require("custom/configs/general")
local rust_utils = require("custom/configs/rust_utils")


local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins/configs/lspconfig"
      require "custom/configs/lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
        "codelldb", "rust-analyzer",
        "tailwindcss-language-server",
        "html-lsp", "typescript-language-server", "taplo",
        "angular-language-server", "marksman", "css-lsp", "eslint-lsp"
       })
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    configs = function()
      require "plugins/configs/lspconfig"
      require "custom/configs/lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {'nvim-telescope/telescope-ui-select.nvim' },
    configs = function()
      require "plugins/configs/telescope"
      require "custom/configs/telescope"
    end,
  },
  rust_utils,
  general
}

return plugins
