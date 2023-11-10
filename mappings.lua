local M = {}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint<CR>",
      "Toggle breakpoint"
    },
    ["<leader>dus"] = {
      function ()
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
    ["<leader>rcu"]={
      function ()
        require("crates").upgrade_all_crates()
      end,
      "Update crates"
    },
    ["<leader>q"]={
      "<cmd>q!<CR>",
      "Exit"
    }
  }
}

M.masksman = {
  n = {
    ["<leader>t"]={
      "<cmd>MarkdownPreviewToggle<CR>",
      "Preview markdown toggle"
    }
  }
}

M.general = {
  n = {
    ["<C-z>"] = {
      function ()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Next diagnostic"
    },
    ["<C-x>"] = {
      function ()
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
    }
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
