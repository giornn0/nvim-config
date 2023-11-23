local general = require "custom/configs/general"
local lspconfig = require "custom/configs/lspconfig"
local mason = require "custom/configs/mason"
local none_ls = require "custom/configs/none_ls"
local rust_utils = require "custom/configs/rust_utils"
local sessions = require "custom/configs/sessions"
local telescope = require "custom/configs/telescope"
local treesitter = require "custom/configs/treesitter"

local plugins = {

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.nvimtree",
  },
  general,
  lspconfig,
  mason,
  none_ls,
  sessions,
  rust_utils,
  telescope,
  treesitter,
}

return plugins
