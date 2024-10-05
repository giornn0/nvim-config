return {
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
    --Uncomment this if you work with wasm rust
    "rust",
    --Uncomment this if you work with phoenix
    "heex",
    "eelixir",
    "htmlangular",
    -- --Uncoment this if you are working with sigil templates ~H within elixir files
    -- -- "elixir",
  },
  init_options = {
    -- There you can set languages to be considered as different ones by tailwind lsp I guess same as includeLanguages in VSCod
    userLanguages = {
      --Uncomment this if you work with wasm rust
      rust = "html",
      --Uncomment this if you work with phoenix
      eelixir = "html-eex",
      heex = "html-eex",
      htmlangular = "html",
      --Uncoment this if you are working with sigil templates ~H within elixir files
      -- elixir = "html-eex",
    },
  },
  settings = {
    tailwindCSS = {
      emmetCompletions = true,
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      experimental = {
        classRegex = {
          'class[:]\\s*"([^"]*)"',
        },
      },
    },
  },
}
