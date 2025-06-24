return {
  -- better quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {},
  },

  -- replace in quickfix
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    opts = {},
    keys = {
      {
        "<leader>xq",
        function()
          require("quicker").toggle({
            focus = true,
            open_cmd_mods = { split = "belowright" },
          })
        end,
        desc = "Toggle quickfix list",
      },

      {
        "<leader>xl",
        function()
          require("quicker").toggle({
            focus = true,
            loclist = true,
            open_cmd_mods = { split = "belowright" },
          })
        end,
        desc = "Toggle quickfix list",
      },
    },
  },
}
