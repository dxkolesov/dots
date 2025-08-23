return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = {
    filters = { dotfiles = false },
    disable_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
    },
    view = {
      width = 35,
      preserve_window_proportions = true,
    },
    renderer = {
      root_folder_label = false,
      highlight_git = true,
      indent_markers = { enable = true },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("nvim-tree.api").tree.toggle({ focus = false })
      end,
      desc = "Toggle Explorer",
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { link = "SnacksIndent" })
  end,
}
