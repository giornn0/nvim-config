 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#131317',
    base01 = '#201f23',
    base02 = '#2a292e',
    base03 = '#918f9b',
    base04 = '#c8c5d1',
    base05 = '#e5e1e7',
    base06 = '#e5e1e7',
    base07 = '#e5e1e7',
    base08 = '#ffb4ab',
    base09 = '#fab0e2',
    base0A = '#c6c3e2',
    base0B = '#c2c1ff',
    base0C = '#fab0e2',
    base0D = '#c2c1ff',
    base0E = '#c6c3e2',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e5e1e7',          bg = '#131317' })
  hi('TelescopeBorder',         { fg = '#918f9b',             bg = '#131317' })
  hi('TelescopePromptNormal',   { fg = '#e5e1e7',          bg = '#131317' })
  hi('TelescopePromptBorder',   { fg = '#918f9b',             bg = '#131317' })
  hi('TelescopePromptPrefix',   { fg = '#c2c1ff',             bg = '#131317' })
  hi('TelescopePromptCounter',  { fg = '#c8c5d1',  bg = '#131317' })
  hi('TelescopePromptTitle',    { fg = '#131317',             bg = '#c2c1ff' })
  hi('TelescopePreviewTitle',   { fg = '#131317',             bg = '#c6c3e2' })
  hi('TelescopeResultsTitle',   { fg = '#131317',             bg = '#fab0e2' })
  hi('TelescopeSelection',      { fg = '#e5e1e7',          bg = '#2a292e' })
  hi('TelescopeSelectionCaret', { fg = '#c2c1ff',             bg = '#2a292e' })
  hi('TelescopeMatching',       { fg = '#c2c1ff',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
