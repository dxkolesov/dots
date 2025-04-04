return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- rainbow-delimiters
      {
        "HiPhish/rainbow-delimiters.nvim",
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
