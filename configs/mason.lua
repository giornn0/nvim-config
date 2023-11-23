--require("mason").setup()
--require("mason-lspconfig").setup()
return {
  "williamboman/mason.nvim",
  dependencies = { "nvimtools/none-ls.nvim" },
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "codelldb",
        "rust-analyzer",
        "tailwindcss-language-server",
        "html-lsp",
        "typescript-language-server",
        "taplo",
        "angular-language-server",
        "marksman",
        "css-lsp",
        "eslint_d",
        "prettier",
        "stylua",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "selene",
        "yaml-language-server",
        "yamllint",
        "elixir-ls",
        "eslint-lsp",
      })
    end
  end,
}
