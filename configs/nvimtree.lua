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

if type(opts.filters) == "table" then
  vim.list_extend(opts.filters, {
    dotfiles = false,
  })
else
  opts.filters = {
    dotfiles = false,
  }
end
return opts
