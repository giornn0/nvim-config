local config = function()
  local telescope = require "telescope"

  vim.notify = require "notify"

  local actions = require "telescope.actions"
  local fb_actions = telescope.extensions.file_browser.actions
  telescope.setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          -- even more opts
        },
      },
      "notify",
      workspaces = {
        -- keep insert mode after selection in the picker, default is false
        keep_insert = true,
      },
      file_browser = {
        theme = "dropdown",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          -- your custom insert mode mappings
          ["i"] = {
            ["<C-w>"] = function()
              vim.cmd "normal vbd"
            end,
          },
          ["n"] = {
            -- your custom normal mode mappings
            ["N"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd "startinsert"
            end,
            ["<C-p>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-n>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
            ["<PageUp>"] = actions.preview_scrolling_up,
            ["<PageDown>"] = actions.preview_scrolling_down,
          },
        },
      },
    },
  }

  telescope.load_extension "ui-select"
  telescope.load_extension "notify"
  telescope.load_extension "workspaces"
  telescope.load_extension "file_browser"
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = config,
  opts = function()
    return require "plugins.configs.telescope"
  end,
}
