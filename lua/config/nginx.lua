vim.filetype.add({
  pattern = {
    [".conf"] = "nginx",
  },
})

return {
  cmd = { "nginx-language-server" },
  filetypes = { "nginx" },
}
