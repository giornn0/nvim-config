return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = { "rust", "toml" },
    opts = {
      src = {
        cmp = { enabled = true },
      },
    },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  -- {
  --   "rfussenegger/nvim-dap"
  -- },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust", "rs" },
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      local on_attach = require("plugins.configs.lspconfig").on_attach
      local capabilities = require("plugins.configs.lspconfig").capabilities
      return {
        server = {
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil
          end,
          capabilities = capabilities,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                buildScripts = {
                  enable = true,
                },
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              lens = {
                enable = true,
              },
              check = {
                command = "clippy",
              },
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                  -- ["leptos_macro"] = { "component", "server" },
                },
              },
            },
          },
        },
        tools = { -- rust-tools options
          -- options right now: termopen / quickfix / toggleterm / vimux
          executor = require("rust-tools.executors").toggleterm,
          runnables = {
            use_telescope = true,
          },
          on_initialized = function()
            vim.cmd [[
              augroup RustLSP
                autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
              augroup END
            ]]
          end,
          reload_workspace_from_cargo_toml = true,
          -- These apply to the default RustSetInlayHints command
          inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = false,
            parameter_hints_prefix = " ",
            other_hints_prefix = " ",
            max_len_align_padding = 1,
            right_align_padding = 7,
            -- The color of the hints
            highlight = "Comment",
          },
        },
      }
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
}
