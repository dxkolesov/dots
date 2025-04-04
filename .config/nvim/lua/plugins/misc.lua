return {
  -- colorizer
  {
    "brenoprata10/nvim-highlight-colors",
    event = "LazyFile",
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

  -- obsidian
  {
    "obsidian-nvim/obsidian.nvim",
    event = { "BufReadPre  */obsidian-vault/*.md" },
    keys = {
      { "<leader>o", "", desc = "+obsidian", mode = { "n", "v" } },

      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
      { "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<cr>", desc = "Toggle Checkbox" },
      { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Daily Note" },
      { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Links" },
      { "<leader>om", "<cmd>ObsidianTemplate<cr>", desc = "Template" },
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Note" },
      { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open Note" },
      { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image" },
      { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search" },
      { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Tags" },
      { "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Workspace" },
      { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday's Note" },

      {
        "<leader>oe",
        function()
          local title = vim.fn.input({ prompt = "Enter title (optional): " })
          vim.cmd("ObsidianExtractNote " .. title)
        end,
        desc = "Extract text into new note",
        mode = { "v" },
      },
      {
        "<leader>ol",
        function()
          vim.cmd("ObsidianLink")
        end,
        desc = "Link text to an existing note",
        mode = { "v" },
      },
      {
        "<leader>on",
        function()
          vim.cmd("ObsidianLinkNew")
        end,
        desc = "Link text to a new note",
        mode = { "v" },
      },
    },
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

  -- ghostty config file highlighting
  {
    "ghostty",
    dir = "/Applications/Ghostty.app/Contents/Resources/vim/vimfiles/",
    lazy = false,
  },
}
