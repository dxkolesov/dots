return {
  -- disable alpha
  { "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },

  -- persistence
  {
    "folke/persistence.nvim",
    event = "VeryLazy",
    init = function()
      -- open explorer after session load
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistenceLoadPost",
        callback = function()
          require("snacks").explorer({
            cwd = LazyVim.root(),
            focus = false,
          })
        end,
      })

      -- load session on startup
      vim.schedule(function()
        require("persistence").load()
      end)
    end,
  },
}
