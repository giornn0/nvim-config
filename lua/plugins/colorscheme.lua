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
    priority = 1000,
    opts = function()
      return {
        transparent_background = true, -- Enable transparent background
        flavour = "macchiato", -- Set the flavor of the color scheme
        auto_integrations = true,
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
      -- colorscheme = "solarized-osaka",
    },
  },
}
