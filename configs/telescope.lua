local telescope = require("plugins.configs.telescope")

telescope.setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}

telescope.load_extension("ui-select")
-- telescope.load_extension("file-browser")
