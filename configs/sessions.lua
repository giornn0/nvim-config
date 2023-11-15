local workspace_path = "/home/giornn0/.config/nvim/lua/custom/workspaces"
local session_path = "~/.config/nvim/lua/custom/sessions"

return {
  {
    "natecraddock/sessions.nvim",
    events = { "VimLeavePre" },
    opts = {
      events = { "VimLeavePre" },
      session_filepath = session_path,
      absolute = true,
    },
  },
  {
    "natecraddock/workspaces.nvim",
    dependencies = "natecraddock/sessions.nvim",
    event = "VeryLazy",
    opts = {
      -- path to a file to store workspaces data in
      -- on a unix system this would be ~/.local/share/nvim/workspaces
      path = workspace_path,

      -- to change directory for nvim (:cd), or only for window (:lcd)
      -- deprecated, use cd_type instead
      -- global_cd = true,

      -- controls how the directory is changed. valid options are "global", "local", and "tab"
      --   "global" changes directory for the neovim process. same as the :cd command
      --   "local" changes directory for the current window. same as the :lcd command
      --   "tab" changes directory for the current tab. same as the :tcd command
      --
      -- if set, overrides the value of global_cd
      cd_type = "global",

      -- sort the list of workspaces by name after loading from the workspaces path.
      sort = true,

      -- sort by recent use rather than by name. requires sort to be true
      mru_sort = true,

      -- option to automatically activate workspace when opening neovim in a workspace directory
      auto_open = true,

      -- enable info-level notifications after adding or removing a workspace
      notify_info = true,

      -- lists of hooks to run after specific actions
      -- hooks can be a lua function or a vim command (string)
      -- lua hooks take a name, a path, and an optional state table
      -- if only one hook is needed, the list may be omitted
      hooks = {
        add = function()
          require("sessions").save(nil, {})
        end,
        remove = {},
        rename = {},
        open = function()
          require("sessions").load(nil, { silent = true })
          -- return { "NvimTreeOpen", "Telescope find_files" }
        end,
      },
    },
  },
}
