local config = function()
  local none_ls = require "null-ls"
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  -- vim.notify = require "notify"

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
      none_ls.builtins.diagnostics.credo,
      none_ls.builtins.formatting.mix,
      none_ls.builtins.diagnostics.selene,
      none_ls.builtins.diagnostics.yamllint,
      none_ls.builtins.formatting.prettier,
      none_ls.builtins.formatting.stylua,
      none_ls.builtins.formatting.leptosfmt,
      -- none_ls.builtins.formatting.alejandra,
      -- none_ls.builtins.diagnostics.fish,
      none_ls.builtins.diagnostics.eslint_d.with {
        diagnostics_format = "[eslint] #{m}\n(#{c})",
      },
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
end

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mason.nvim",
  },
  ft = {
    "lua",
    "typescript",
    "html",
    "tsx",
    "css",
    "jsx",
    "javascript",
    "elixir",
  },
  config = config,
}
