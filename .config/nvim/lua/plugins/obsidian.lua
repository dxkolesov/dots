return {
  {
    "epwalsh/obsidian.nvim",
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
        folder = "Daily",
      },

      -- if blink.cmp
      completion = {
        nvim_cmp = false,
      },
    },
  },
}
