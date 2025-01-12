return {
  keys = {
    {
      "<leader>co",
      LazyVim.lsp.action["source.organizeImports"],
      desc = "Organize Imports",
    },
  },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = vim.fn.has("nvim-0.10") == 0 and { dynamicRegistration = true },
    },
  },
}
