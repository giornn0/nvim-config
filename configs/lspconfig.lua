local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

--Tailwind - HTML - CSS
lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "css",
      "scss",
      "sass",
      "postcss",
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
      "vue",
    --Remove this if you dont work with wasm rust
      "rust",
    },
    init_options = {
      -- There you can set languages to be considered as different ones by tailwind lsp I guess same as includeLanguages in VSCod
      userLanguages = {
      --Remove this if you dont work with wasm rust
        rust = "html",
      },
    },
    settings = {
      tailwindCSS = {
        emmetCompletions = true,
        classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning",
        },
        validate = true,
      },
    },
  }
)

--Enable (broadcasting) snippet capability for completion
local capabilities_html = vim.lsp.protocol.make_client_capabilities()
capabilities_html.textDocument.completion.completionItem.snippetSupport = true
lspconfig.html.setup({
    capabilities = capabilities_html,
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})

--Angular LSP
--This path can be different according to the os.
local base_user_node_modules = "/usr/lib/node_modules"
local cmd = {
    base_user_node_modules.."/@angular/language-server/bin/ngserver",
    "--ngProbeLocations",
    base_user_node_modules.."/@angular/language-server/lib",
    "--tsProbeLocations",
    base_user_node_modules.."/typescript/lib",
    "--stdio",
}

lspconfig.angularls.setup{
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
    end
}

--Typescript LSP
--Need a little bit more of love this part
local protocol = require('vim.lsp.protocol')

local on_attach_ts = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format() end
    })
  end
  -- on_attach(client,bufnr)
end

lspconfig.tsserver.setup {
 on_attach = on_attach_ts,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
lspconfig.eslint.setup({
  capabilities = capabilities,
  -- on_attach = on_attach,
})

-- Extras
lspconfig.marksman.setup{
  on_attach = on_attach,
  capabilities =capabilities
}
