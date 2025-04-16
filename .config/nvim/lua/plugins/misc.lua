return {
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

  -- rainbow parentheses
  {
    "HiPhish/rainbow-delimiters.nvim",
    main = "rainbow-delimiters.setup",
    event = "LazyFile",
    opts = {
      highlight = {
        "Constant",
        "Type",
        "Function",
        "Number",
        "String",
        "Keyword",
        "Special",
      },
    },
  },

  -- obsidian
  {
    "obsidian-nvim/obsidian.nvim",
    event = { "BufReadPre  */obsidian-vault/*.md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      ui = { enable = false },
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      },

      dir = vim.env.HOME .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian-vault",

      daily_notes = {
        folder = "daily",
      },

      -- if blink.cmp
      completion = {
        nvim_cmp = false,
        blink = true,
      },
    },
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
