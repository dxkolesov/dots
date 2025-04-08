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
    keys = (function()
      local keys = {}
      for i = 1, 9 do
        table.insert(keys, {
          "<leader>" .. i,
          "<cmd>lua require('bufferline').go_to_buffer(" .. i .. ", true)<cr>",
          desc = "which_key_ignore",
        })
      end
      return keys
    end)(),
  },
}
