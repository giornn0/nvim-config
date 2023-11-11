local general = require "custom/configs/general"
local sessions = require "custom/configs/sessions"
local rust_utils = require "custom/configs/rust_utils"

local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins/configs/lspconfig"
      require "custom/configs/lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = { "nvimtools/none-ls.nvim" },
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "codelldb",
          "rust-analyzer",
          "tailwindcss-language-server",
          "html-lsp",
          "typescript-language-server",
          "taplo",
          "angular-language-server",
          "marksman",
          "css-lsp",
          "eslint_d",
          "prettier",
          "stylua",
          "dockerfile-language-server",
          "docker-compose-language-service",
          "selene",
          "yaml-language-server",
          "yamllint",
        })
      end
    end,
    configs = function()
      require "plugins/configs/mason"
      require "custom/configs/mason"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "rcarriga/nvim-notify" },
    configs = function()
      require "plugins/configs/treesitter"
      require "custom/configs/treesitter"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-ui-select.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    configs = function()
      require "plugins/configs/telescope"
      require "custom/configs/telescope"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
      require "custom.configs.none_ls"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.git = {
        enable = true,
      }
      opts.diagnostics = {
        enable = true,
      }
    end,
  },
  rust_utils,
  general,
  sessions,
}

return plugins
