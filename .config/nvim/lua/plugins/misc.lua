return {
  -- colorizer
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    cmd = "HighlightColors",
    opts = {
      enable_tailwind = true,
      enabled_named_colors = false,
    },
  },

  -- tmux
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- text-case
  {
    "johmsalas/text-case.nvim",
    opts = {},
    cmd = "Subs",
  },

  -- vim-be-good
  {
    "ThePrimeagen/vim-be-good",
    cmd = {
      "VimBeGood",
    },
  },

  -- mason border
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "single",
      },
    },
  },

  -- lsp border
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function(_, opts)
      -- add border
      require("lspconfig.ui.windows").default_options.border = "single"

      -- diagnostic border
      vim.diagnostic.config({ float = { border = "single" } })

      -- hover border
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      for _, key in ipairs(keys) do
        if key[1] == "K" then
          key[2] = function()
            return vim.lsp.buf.hover({ border = "single" })
          end
          break
        end
      end

      opts.keys = keys
    end,
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
