--INFO: PHP lsp
vim.g.lazyvim_php_lsp = "intelephense"

--INFO: Fold config
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

--INFO: General config
vim.wo.relativenumber = false

--INFO: JS Linter
-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = false
--INFO: JS Formatter
-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true
