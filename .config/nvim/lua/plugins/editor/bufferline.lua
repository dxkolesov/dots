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

        offsets = {
          {
            filetype = "snacks_layout_box",
            highlight = "BufferLineOffsetSeparator",
          },
        },
      },

      highlights = (function()
        local bg = "#000000"
        return {
          background = { bg = bg },
          buffer_visible = { bg = bg },
          buffer_selected = { bg = bg, italic = false },
          duplicate_selected = { bg = bg },
          duplicate_visible = { bg = bg },
          duplicate = { bg = bg },
          tab = { bg = bg },
          tab_selected = { bg = bg },
          tab_separator = { bg = bg },
          tab_separator_selected = { bg = bg },
          tab_close = { bg = bg },
          indicator_visible = { bg = bg },
          indicator_selected = { bg = bg },
          separator = { bg = bg },
          separator_visible = { bg = bg },
          separator_selected = { bg = bg },
          offset_separator = { bg = bg },
          close_button = { bg = bg },
          close_button_visible = { bg = bg },
          close_button_selected = { bg = bg },
          fill = { bg = bg },
          numbers = { bg = bg },
          numbers_visible = { bg = bg },
          numbers_selected = { bg = bg, italic = false },
          error = { bg = bg },
          error_visible = { bg = bg },
          error_selected = { bg = bg },
          error_diagnostic = { bg = bg },
          error_diagnostic_visible = { bg = bg },
          error_diagnostic_selected = { bg = bg },
          warning = { bg = bg },
          warning_visible = { bg = bg },
          warning_selected = { bg = bg },
          warning_diagnostic = { bg = bg },
          warning_diagnostic_visible = { bg = bg },
          warning_diagnostic_selected = { bg = bg },
          info = { bg = bg },
          info_visible = { bg = bg },
          info_selected = { bg = bg },
          info_diagnostic = { bg = bg },
          info_diagnostic_visible = { bg = bg },
          info_diagnostic_selected = { bg = bg },
          hint = { bg = bg },
          hint_visible = { bg = bg },
          hint_selected = { bg = bg },
          hint_diagnostic = { bg = bg },
          hint_diagnostic_visible = { bg = bg },
          hint_diagnostic_selected = { bg = bg },
          diagnostic = { bg = bg },
          diagnostic_visible = { bg = bg },
          diagnostic_selected = { bg = bg },
          modified = { bg = bg },
          modified_visible = { bg = bg },
          modified_selected = { bg = bg },
        }
      end)(),
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
