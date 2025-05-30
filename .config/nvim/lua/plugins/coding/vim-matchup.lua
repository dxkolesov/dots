return {
  -- better %
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "andymass/vim-matchup",
      "airblade/vim-matchquote",
    },
    init = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,

    opts = {
      matchup = {
        enable = true,
        disable_virtual_text = true,
      },
    },
  },
}
