return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- hlargs
      {
        "m-demare/hlargs.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
      },

      -- rainbow-delimiters
      {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
          require("rainbow-delimiters.setup").setup({
            highlight = {
              "Constant",
              "Type",
              "Function",
              "Number",
              "String",
              "Keyword",
              "Special",
            },
          })
        end,
      },
    },
  },
}
