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
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- css
        "css",
        "scss",

        -- shaders
        "glsl",
      })
    end,
  },
}
