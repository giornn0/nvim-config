local opts = require "plugins.configs.nvimtree"
opts.git = {
  enable = true,
  ignore = true,
}
opts.renderer = {
  root_folder_label = true,
  highlight_git = true,

  icons = {
    show = {
      git = true,
    },
  },
}
return opts
