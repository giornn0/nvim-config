local M = {}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint<CR>",
      "Toggle breakpoint"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar"
    },
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "Update crates"
    },
    ["<leader>Tt"] = {
      function()
        require('crates').toggle()
      end,
      "Toggle"
    },
    ["<leader>Tr"] = {
      function()
        require('crates').reload()
      end,
      "Reload"
    },
    ["<leader>Tv"] = {
      function()
        require('crates').show_versions_popup()
      end,
      "Show version popup"
    },
    ["<leader>Tf"] = {
      function()
        require('crates').show_features_popup()
      end,
      "Show features popup"
    },
    ["<leader>Td"] = {
      function()
        require('crates').show_dependencies_popup()
      end,
      "Show dependencies popup"
    },
    ["<leader>Tu"] = {
      function()
        require('crates').update_crate()
      end,
      "Update crate"
    },
    ["<leader>Ta"] = {
      function()
        require('crates').update_all_crates()
      end,
      "Update all crates"
    },
    ["<leader>TU"] = {
      function()
        require('crates').upgrade_crate()
      end,
      "Upgrade crate"
    },
    ["<leader>TA"] = {
      function()
        require('crates').upgrade_all_crates()
      end,
      "Upgrade all crates"
    },
    ["<leader>TH"] = {
      function()
        require('crates').open_homepage()
      end,
      "Open homepage"
    },
    ["<leader>TR"] = {
      function()
        require('crates').open_repository()
      end,
      "Open repository"
    },
    ["<leader>TD"] = {
      function()
        require('crates').open_documentation()
      end,
      "Open documentation"
    },
    ["<leader>TC"] = {
      function()
        require('crates').open_crates_io()
      end,
      "Open crates.io"
    },
  }
}

M.general = {
  n = {
    ["<C-z>"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Next diagnostic"
    },
    ["<C-x>"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Next diagnostic"
    },
    ["<leader>gt"] = {
      --Need some work
      -- function ()
      --   require("gitui").open()
      -- end,
      "<cmd> LazyGit <CR>",
      "Open gitui"
    },
    ["<leader>tm"] = {
      "<cmd>MarkdownPreviewToggle<CR>",
      "Preview markdown toggle"
    },
    ["<leader>S"] = {
      function() end,
      "Workspaces"
    },
    ["<leader>Sp"] = {
      "<cmd> WorkspacesOpen <CR>",
      "Open workspaces picker"
    },
    ["<leader>Sr"] = {
      "<cmd> WorkspacesRemove <CR>",
      "Remove current workspace"
    },
    ["<leader>Ss"] = {
      "<cmd> WorkspacesAdd <CR>",
      "Save current workspace"
    },
    ["<leader>q"] = {
      "<cmd>q!<CR>",
      "Exit"
    },
    ["<leader>h>"] = {
      "<cmd> ToggleTerm size=40  direction=horizontal <CR>",
      "Toggle horizontal term",
    },
    ["<leader>v>"] = {
      "<cmd> ToggleTerm size=40  direction=vertical <CR>",
      "Toggle vertical term",
    },
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  }
}
return M
