return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "LazyFile",
    main = "rainbow-delimiters.setup",
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
}
