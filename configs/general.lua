return {
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      opts.current_line_blame = true
      if type(opts.current_line_blame_opts) == "table" then
        vim.list_extend(opts.current_line_blame_opts, {
          {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 300,
            ignore_whitespace = false,
          },
        })
      end
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      render = "background", -- or 'foreground' or 'first_column'
      enable_named_colors = true,
      enable_tailwind = true,
    },
  },
  { "mg979/vim-visual-multi", event = "VeryLazy" },
  {
    "akinsho/toggleterm.nvim",
    commands = { "ToggleTerm" },
    version = "*",
    opts = {
      --[[ things you want to change go here]]
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "gbprod/cutlass.nvim",
    event = "VeryLazy",
    opts = {
      cut_key = "m",
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    opts = {
      filetypes = {
        "html",
        "heex",
        "xml",
        "jsx",
        "tsx",
        "typescriptreact",
        "javascriptreact",
        "markdown",
        "typescript",
        "javascript",
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    }, -- this is equalent to setup({}) function
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  --Need to help to use
  -- {
  --   "aspeddro/gitui.nvim",
  --   event = "VeryLazy",
  --   opts = {}
  -- },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        win_options = {
          winhighlight = "NormalFloat:DiagnosticError",
        },
      },
      select = {
        get_config = function(opts)
          if opts.kind == "codeaction" then
            return {
              backend = "nui",
              nui = {
                relative = "cursor",
                max_width = 40,
              },
            }
          end
        end,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      -- See https://github.com/neovim/nvim-lspconfig/issues/1931#issuecomment-1297599534
      -- An alternative solution: https://github.com/neovim/neovim/issues/20457#issuecomment-1266782345
      local banned_messages = { "No information available" }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require "notify"(msg, ...)
      end
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  -- {
  --   "rfussenegger/nvim-dap",
  -- },
}
