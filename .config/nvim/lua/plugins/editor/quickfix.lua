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
          })
        end,
        desc = "Toggle quickfix list",
      },
    },
  },
}
