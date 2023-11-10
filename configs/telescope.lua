local telescope = require("plugins.configs.telescope")
vim.notify = require("notify")
telescope.setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },
    "notify"
  }
}

telescope.load_extension("ui-select")
telescope.load_extension("notify")
-- telescope.load_extension("file-browser")
