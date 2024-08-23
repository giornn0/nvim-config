local function default_formatter(bufnr)
  local has_prettier = vim.fs.find({
    -- https://prettier.io/docs/en/configuration.html
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.json5",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.toml",
    ".editorconfig",
    "prettier.config.js",
    "prettier.config.cjs",
  }, { upward = true })[1]
  if has_prettier then
    return { "prettier" }
  end
  local has_eslint = vim.fs.find({
    -- https://prettier.io/docs/en/configuration.html
    ".eslintrc.json",
  }, { upward = true })[1]
  if has_eslint then
    return { "eslint" }
  end
  return { "biome" }
end

return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    -- add tsx and treesitter
    opts.formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft, {
      ["javascript"] = default_formatter,
      ["javascriptreact"] = default_formatter,
      ["typescript"] = default_formatter,
      ["typescriptreact"] = default_formatter,
      ["json"] = default_formatter,
      ["jsonc"] = default_formatter,
      -- ["vue"] = { "biome" },
      ["css"] = default_formatter,
      ["scss"] = default_formatter,
      ["less"] = default_formatter,
      ["html"] = default_formatter,
      ["php"] = { "php_cs_fixer" },
    })
  end,
}
