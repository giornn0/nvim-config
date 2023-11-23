local config = function()
  local treesitter = require "nvim-treesitter"

  treesitter.setup {
    highlight = {
      enable = true,
      -- additional_vim_regex_highlighting = true,
      -- disable = { "rust" },
    },
    -- indent = {
    --   enable = true,
    --   -- disable = {},
    -- },
    ensure_installed = {
      "tsx",
      "toml",
      "fish",
      "json",
      "yaml",
      "css",
      "html",
      "lua",
      "ron",
      "rust",
      "scss",
      "typescriptreact",
      "markdown",
      "typescript",
      "javascript",
      "elixir",
      "heex",
      "eex",
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
  opts = function()
    return require "plugins/configs/treesitter"
  end,
  -- config = config,
}
