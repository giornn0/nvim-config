local none_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.notify = require "notify"

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

none_ls.setup {
  sources = {
    -- none_ls.builtins.diagnostics.luacheck,
    none_ls.builtins.formatting.prettier,
    none_ls.builtins.formatting.stylua,
    none_ls.builtins.formatting.leptosfmt,
    none_ls.builtins.diagnostics.eslint_d.with {
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    },
    none_ls.builtins.diagnostics.fish,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
}

vim.api.nvim_create_user_command("DisableLspFormatting", function()
  vim.api.nvim_clear_autocmds { group = augroup, buffer = 0 }
end, { nargs = 0 })
