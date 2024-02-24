local config = function()
  local config_nvchad = require "plugins/configs/lspconfig"
  local on_attach = config_nvchad.on_attach
  local capabilities = config_nvchad.capabilities

  local banned_messages = { "No information available" }
  vim.notify = function(msg, ...)
    for _, banned in ipairs(banned_messages) do
      if msg == banned then
        return
      end
    end
    return require "notify"(msg, ...)
  end

  local lspconfig = require "lspconfig"
  local protocol = require "vim.lsp.protocol"

  local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
  local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds { group = augroup_format, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup_format,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end

  --Docker + YAML
  lspconfig.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  lspconfig.docker_compose_language_service.setup {
    on_attach = enable_format_on_save,
    capabilities = capabilities,
  }
  lspconfig.yamlls.setup {
    on_attach = enable_format_on_save,
    capabilities = capabilities,
  }
  lspconfig.nil_ls.setup {
    on_attach = enable_format_on_save,
    capabilities = capabilities,
    command = "nil",
    settings = {
      ["nil"] = {
        formatting = {
          command = { "alejandra", "-q" },
        },
      },
    },
  }

  lspconfig.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  --Enable (broadcasting) snippet capability for completion
  local capabilities_html = vim.lsp.protocol.make_client_capabilities()
  capabilities_html.textDocument.completion.completionItem.snippetSupport = true
  lspconfig.html.setup {
    capabilities = capabilities_html,
    on_attach = enable_format_on_save,
    filetypes = { "html", "heex" },
  }

  lspconfig.taplo.setup {
    on_attach = enable_format_on_save,
    capabilities = capabilities,
  }

  --Angular LSP
  --This path can be different according to the os.
  -- local base_user_node_modules = "/usr/lib/node_modules"
  -- local cmd = {
  --   base_user_node_modules .. "/@angular/language-server/bin/ngserver",
  --   "--ngProbeLocations",
  --   base_user_node_modules .. "/@angular/language-server/lib",
  --   "--tsProbeLocations",
  --   base_user_node_modules .. "/typescript/lib",
  --   "--stdio",
  -- }

  -- lspconfig.angularls.setup {
  --   cmd = cmd,
  --   on_new_config = function(new_config, new_root_dir)
  --     new_config.cmd = cmd
  --   end,
  -- }

  protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "", -- TypeParameter
  }

  -- Set up completion using nvim_cmp with LSP source

  lspconfig.tsserver.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = capabilities,
  }

  lspconfig.eslint.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      enable_format_on_save(client, bufnr)
    end,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
    capabilities = capabilities,
  }

  lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      enable_format_on_save(client, bufnr)
    end,
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },

        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
      },
    },
  }

  lspconfig.tailwindcss.setup {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern(
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
      "postcss.config.js",
      "postcss.config.cjs",
      "postcss.config.mjs",
      "postcss.config.ts",
      "package.json",
      "node_modules",
      ".git",
      "mix.exs"
    ),
    capabilities = capabilities,
    filetypes = {
      "css",
      "scss",
      "sass",
      "postcss",
      "html",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "heex",
      "eelixir",
      --Uncoment this if you dont work with wasm rust
      -- "rust",
      --Uncoment this if you are working with sigil templates ~H within elixir files
      -- "elixir",
    },
    init_options = {
      -- There you can set languages to be considered as different ones by tailwind lsp I guess same as includeLanguages in VSCod
      userLanguages = {
        --Uncoment this if you dont work with wasm rust
        -- rust = "html",
        --Uncoment this if you are working with sigil templates ~H within elixir files
        -- elixir = "html-eex",
        eelixir = "html-eex",
        heex = "html-eex",
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
        experimental = {
          classRegex = {
            'class[:]\\s*"([^"]*)"',
          },
        },
      },
    },
  }

  lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "\u{ea71}" },
    severity_sort = true,
  })

  lspconfig.elixirls.setup {
    cmd = { "elixir-ls" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = { elixirLS = { dialyzerEnabled = false } },
  }

  lspconfig.gleam.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- Diagnostic symbols in the sign column (gutter)
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  vim.diagnostic.config {
    virtual_text = true,
    -- update_in_insert = true,
    float = {
      source = "always", -- Or "if_many"
    },
    signs = true,
    severity_sort = true,
  }
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "rcarriga/nvim-notify",
    "williamboman/mason-lspconfig.nvim",
  },
  config = config,
}
