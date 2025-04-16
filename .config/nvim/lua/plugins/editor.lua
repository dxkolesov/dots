return {
  -- tabs
  {
    "akinsho/bufferline.nvim",
    dependencies = "echasnovski/mini.icons",
    opts = {
      options = {
        -- relative buffer numbers
        numbers = function(opts)
          local state = require("bufferline.state")
          for i, buf in ipairs(state.components) do
            if buf.id == opts.id then
              return i
            end
          end
          return opts.ordinal
        end,

        always_show_bufferline = true,
        show_buffer_close_icons = false,
        indicator = {
          style = "none",
        },
        offsets = {
          {
            filetype = "snacks_layout_box",
            -- highlight = "Directory",
          },
        },
      },

      highlights = {
        buffer_selected = {
          italic = false,
        },
        numbers_selected = {
          italic = false,
        },
      },
    },
    keys = {
      { "<leader>1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", desc = "which_key_ignore" },
      { "<leader>2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", desc = "which_key_ignore" },
      { "<leader>3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", desc = "which_key_ignore" },
      { "<leader>4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", desc = "which_key_ignore" },
      { "<leader>5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", desc = "which_key_ignore" },
      { "<leader>6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", desc = "which_key_ignore" },
      { "<leader>7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", desc = "which_key_ignore" },
      { "<leader>8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", desc = "which_key_ignore" },
      { "<leader>9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", desc = "which_key_ignore" },
    },
  },

  -- file name in split
  {
    "b0o/incline.nvim",
    event = "LazyFile",
    opts = {
      hide = {
        only_win = true,
        focused_win = true,
      },
    },
  },
}
