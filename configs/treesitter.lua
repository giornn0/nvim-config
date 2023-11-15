local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    -- disable = { "rust" },
  },
  indent = {
    enable = true,
    disable = {},
  },
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
    "javascriptreact",
    "markdown",
    "typescript",
    "javascript",
  },
  filetypes = {
    "html",
    "blade.php",
    "javascriptreact",
    "typescriptreact",
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
  },
  autotag = {
    enable = true,
  },
  auto_install = true,
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 5,
    severity_limit = "Warning",
  },
  update_in_insert = true,
})
