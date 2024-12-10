return {
  {
    "gbprod/cutlass.nvim",
    event = "VeryLazy",
    opts = {
      cut_key = "m",
    },
  },
  { "mg979/vim-visual-multi", event = "VeryLazy" },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "direnv/direnv.vim",
    lazy = true,
    init = function(plug)
      local f = io.open(vim.loop.cwd() .. "/.envrc", "r")
      if f ~= nil then
        io.close(f)
        plug.lazy = false
      end
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = {
          silent = true,
        },
      },
    },
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true, -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
}
