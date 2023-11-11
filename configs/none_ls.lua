local none_ls = require "none-ls.nvim"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.notify = require("notify")

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      vim.notify(client.name,3)
      return client.name == "none-ls.nvim"
    end,
    bufnr = bufnr,
  })
end

none_ls.setup {
  sources = {
    none_ls.builtins.diagnostics.luacheck,
    none_ls.builtins.formatting.prettier,
    none_ls.builtins.formatting.stylua,
    none_ls.builtins.formatting.leptosfmt,
    none_ls.builtins.diagnostics.eslint.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    none_ls.builtins.diagnostics.fish
  },
  on_attach = function(client, bufnr)
    vim.notify(client.name,3)
    if client.supports_method("textDocument/formatting") then

      vim.notify(client.name,3)
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)

