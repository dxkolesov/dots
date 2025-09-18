return {
  -- mason border
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  -- change icons
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        diagnostics = {
          Error = "E",
          Warn = "W",
          Hint = "H",
          Info = "I",
        },
      },
    },
  },
}
