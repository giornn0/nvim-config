return {
  keys = {
    {
      "<leader>cp",
      function()
        local params = vim.lsp.util.make_position_params()
        LazyVim.lsp.execute({
          command = "manipulatePipes:serverid",
          arguments = { "toPipe", params.textDocument.uri, params.position.line, params.position.character },
        })
      end,
      desc = "To Pipe",
    },
    {
      "<leader>cP",
      function()
        local params = vim.lsp.util.make_position_params()
        LazyVim.lsp.execute({
          command = "manipulatePipes:serverid",
          arguments = { "fromPipe", params.textDocument.uri, params.position.line, params.position.character },
        })
      end,
      desc = "From Pipe",
    },
  },
  cmd = "",
}
