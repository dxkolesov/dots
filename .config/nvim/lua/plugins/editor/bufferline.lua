return {
  -- tabs
  {
    "akinsho/bufferline.nvim",
    dependencies = "echasnovski/mini.icons",
    opts = {
      options = {
        --  buffer numbers
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

        -- ignore claude buffer
        custom_filter = function(buf_number, buf_numbers)
          local bufname = vim.api.nvim_buf_get_name(buf_number)
          if bufname:match("claude%-code") then
            return false
          end
          return true
        end,
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
    config = function(_, opts)
      require("bufferline").setup(opts)
      local groups = require("bufferline.groups")
      groups.builtin.pinned.icon = "*"
    end,
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
}
