local config = function()
  local treesitter = require "nvim-treesitter"

  treesitter.setup {
    highlight = {
      enable = true,
      -- additional_vim_regex_highlighting = true,
      -- disable = { "rust" },
      use_languagetree = true,
    },
    -- indent = {
    --   enable = true,
    --   -- disable = {},
    -- },
    ensure_installed = {
      "tsx",
      "toml",
      "json",
      "yaml",
      "css",
      "html",
      "lua",
      "ron",
      "rust",
      "scss",
      "markdown",
      "typescript",
      "javascript",
      "elixir",
      "heex",
      "eex",
      "nix",
    },
    filetypes = {
      "html",
      "blade.php",
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rsx",
      "rust",
      "toml",
      "ron",
      "fish",
      "markdown",
      "elixir",
      "heex",
      "lua",
    },
    autotag = {
      enable = true,
      filetypes = {
        "embedded_template",
        -- "elixir",
        "heex",
        "html",
      },
    },
    auto_install = true,
    ident = { enable = true },
    -- rainbow = {
    --   enable = true,
    --   extended_mode = true,
    -- max_file_lines = nil,
    -- },
  }

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
end

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "rcarriga/nvim-notify" },
  lazy = false,
  priority = 999,
  build = ":TSUpdate",
  cmd = { "TSUpdateSync" },
  config = config,
  -- config = config,
}
