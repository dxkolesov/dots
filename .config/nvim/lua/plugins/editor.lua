return {
  -- oil
  {
    "stevearc/oil.nvim",
    opts = {
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<C-s>"] = false,
      },
    },
    keys = {
      {
        "-",
        "<CMD>Oil<CR>",
        mode = { "n", "v" },
        desc = "Open oil",
      },
    },
  },
}
