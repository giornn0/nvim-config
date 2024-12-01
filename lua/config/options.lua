-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.cmd([[let &t_Cs = "\[4:3m"]])
vim.cmd([[let &t_Ce = "\[4:0m"]])

vim.wo.relativenumber = false
vim.g.lazyvim_php_lsp = "intelephense"
-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = true
-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false
