 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#14121b',
    base01 = '#201e27',
    base02 = '#2b2932',
    base03 = '#938ea0',
    base04 = '#c9c4d7',
    base05 = '#e6e0ed',
    base06 = '#e6e0ed',
    base07 = '#e6e0ed',
    base08 = '#ffb4ab',
    base09 = '#ffabf2',
    base0A = '#cabeff',
    base0B = '#cabeff',
    base0C = '#ffabf2',
    base0D = '#cabeff',
    base0E = '#cabeff',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e6e0ed',          bg = '#14121b' })
  hi('TelescopeBorder',         { fg = '#938ea0',             bg = '#14121b' })
  hi('TelescopePromptNormal',   { fg = '#e6e0ed',          bg = '#14121b' })
  hi('TelescopePromptBorder',   { fg = '#938ea0',             bg = '#14121b' })
  hi('TelescopePromptPrefix',   { fg = '#cabeff',             bg = '#14121b' })
  hi('TelescopePromptCounter',  { fg = '#c9c4d7',  bg = '#14121b' })
  hi('TelescopePromptTitle',    { fg = '#14121b',             bg = '#cabeff' })
  hi('TelescopePreviewTitle',   { fg = '#14121b',             bg = '#cabeff' })
  hi('TelescopeResultsTitle',   { fg = '#14121b',             bg = '#ffabf2' })
  hi('TelescopeSelection',      { fg = '#e6e0ed',          bg = '#2b2932' })
  hi('TelescopeSelectionCaret', { fg = '#cabeff',             bg = '#2b2932' })
  hi('TelescopeMatching',       { fg = '#cabeff',             bold = true })
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
