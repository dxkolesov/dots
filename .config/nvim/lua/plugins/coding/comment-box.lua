return {
  {
    "LudoPinelli/comment-box.nvim",
    keys = {
      { "<leader>C", "", desc = "+commentbox", mode = { "n", "v" } },
      {
        "<leader>Cb",
        "<cmd>CBccbox<cr>",
        mode = { "n", "v" },
        desc = "Box Title",
      },
      {
        "<leader>Ct",
        "<cmd>CBllline<cr>",
        mode = { "n", "v" },
        desc = "Titled Line",
      },
      {
        "<leader>Cl",
        "<cmd>CBlline<cr>",
        mode = { "n", "v" },
        desc = "Simple Line",
      },
      {
        "<leader>Cm",
        "<cmd>CBllbox14<cr>",
        mode = { "n", "v" },
        desc = "Marked",
      },
      {
        "<leader>Cd",
        "<cmd>CBd<cr>",
        mode = { "n", "v" },
        desc = "Remove a box",
      },
    },
  },
}
