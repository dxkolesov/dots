return {
  -- BUG: https://github.com/LazyVim/LazyVim/issues/6039
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },

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
