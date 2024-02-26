local function biome_lsp_or_prettier(bufnr)
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
    "prettier.config.js",
    "prettier.config.cjs",
  }, { upward = true })[1]
  if has_prettier then
    return { "prettier" }
  end
  return { "biome" }
end

return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    -- add tsx and treesitter
    opts.formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft, {
      ["javascript"] = biome_lsp_or_prettier,
      ["javascriptreact"] = biome_lsp_or_prettier,
      ["typescript"] = biome_lsp_or_prettier,
      ["typescriptreact"] = biome_lsp_or_prettier,
      ["json"] = biome_lsp_or_prettier,
      ["jsonc"] = biome_lsp_or_prettier,
      -- ["vue"] = { "biome" },
      -- ["css"] = { "biome" },
      -- ["scss"] = { "biome" },
      -- ["less"] = { "biome" },
      -- ["html"] = { "biome" },
    })
  end,
}
