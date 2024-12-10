return {
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
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
}
