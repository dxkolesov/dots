return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    cmd = "HighlightColors",
    opts = {
      enable_tailwind = true,
      enabled_named_colors = false,
    },
  },
}
