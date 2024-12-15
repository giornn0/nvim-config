return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    end,
  },
  {
    -- Plugin for the Catppuccin color scheme
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true, -- Load this plugin immediately
    opts = {
      transparent_background = true, -- Enable transparent background
      flavour = "mocha", -- Set the flavor of the color scheme
    },
    integrations = {
      cmp = true, -- Enable integration with nvim-cmp
      gitsigns = true, -- Enable integration with gitsigns
      nvimtree = true, -- Enable integration with nvim-tree
      treesitter = true, -- Enable integration with treesitter
      notify = false, -- Disable integration with nvim-notify
      mini = {
        enabled = true, -- Enable mini plugin integration
        indentscope_color = "", -- Set indentscope color (empty means default)
      },
      -- Additional plugin integrations can be found in the documentation
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
