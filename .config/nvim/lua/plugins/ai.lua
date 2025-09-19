return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        auto_trigger = true,
      },
      filetypes = { ["*"] = true },
    },
  },

  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   event = "InsertEnter",
  --   cmd = {
  --     "SupermavenUseFree",
  --     "SupermavenUsePro",
  --   },
  --   opts = {
  --     keymaps = {
  --       accept_suggestion = "<M-l>",
  --       clear_suggestion = "<C-]>",
  --       accept_word = "<Nop>",
  --     },
  --
  --     ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
  --   },
  -- },

  {
    "NickvanDyke/opencode.nvim",
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>at",
        function()
          require("opencode").toggle()
        end,
        desc = "Toggle opencode",
      },
      {
        "<leader>aA",
        function()
          require("opencode").ask()
        end,
        desc = "Ask opencode",
      },
      {
        "<leader>aa",
        function()
          require("opencode").ask("@cursor: ")
        end,
        desc = "Ask opencode about this",
      },
      {
        "<leader>aa",
        function()
          require("opencode").ask("@selection: ")
        end,
        mode = "v",
        desc = "Ask opencode about selection",
      },
      {
        "<leader>an",
        function()
          require("opencode").command("session_new")
        end,
        desc = "New opencode session",
      },
      {
        "<leader>ay",
        function()
          require("opencode").command("messages_copy")
        end,
        desc = "Copy last opencode response",
      },
      {
        "<M-C-u>",
        function()
          require("opencode").command("messages_half_page_up")
        end,
        mode = { "n", "v" },
        desc = "Messages half page up",
      },
      {
        "<M-C-d>",
        function()
          require("opencode").command("messages_half_page_down")
        end,
        mode = { "n", "v" },
        desc = "Messages half page down",
      },
      {
        "<leader>as",
        function()
          require("opencode").select()
        end,
        mode = { "n", "v" },
        desc = "Select opencode prompt",
      },
      {
        "<leader>ae",
        function()
          require("opencode").prompt("Explain @cursor and its context")
        end,
        desc = "Explain this code",
      },
      {
        "<leader>ae",
        function()
          require("opencode").prompt("Explain @selection and its context")
        end,
        mode = { "v" },
        desc = "Explain this code",
      },
    },
    config = function()
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`
        terminal = {
          win = {
            width = 0.35,
          },
        },
      }

      -- Required for `opts.auto_reload`
      vim.opt.autoread = true
    end,
  },
}
