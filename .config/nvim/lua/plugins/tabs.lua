return {

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
        separator_style = "slant",
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

      local keys2 = {
        [">b"] = {
          function()
            require("bufferline.commands").move(vim.v.count1)
          end,
          desc = "Move buffer tab right",
        },
        ["<b"] = {
          function()
            require("bufferline.commands").move(-vim.v.count1)
          end,
          desc = "Move buffer tab left",
        },
        ["<Leader>bse"] = {
          function()
            require("bufferline.commands").sort_by("extension")
          end,
          desc = "Sort buffers by extension",
        },
        ["<Leader>bsi"] = {
          function()
            require("bufferline.commands").sort_by("id")
          end,
          desc = "Sort buffers by buffer number",
        },
        ["<Leader>bsm"] = {
          function()
            require("bufferline.commands").sort_by(function(a, b)
              return a.modified and not b.modified
            end)
          end,
          desc = "Sort buffers by last modification",
        },
        ["<Leader>bsp"] = {
          function()
            require("bufferline.commands").sort_by("directory")
          end,
          desc = "Sort buffers by directory",
        },
        ["<Leader>bsr"] = {
          function()
            require("bufferline.commands").sort_by("relative_directory")
          end,
          desc = "Sort buffers by relative directory",
        },
        ["<Leader>b\\"] = {
          function()
            require("bufferline.pick").choose_then(function(id)
              vim.cmd("split")
              vim.cmd("buffer " .. id)
            end)
          end,
          desc = "Open a buffer tab in a new horizontal split with interactive picker",
        },
        ["<Leader>b|"] = {
          function()
            require("bufferline.pick").choose_then(function(id)
              vim.cmd("vsplit")
              vim.cmd("buffer " .. id)
            end)
          end,
          desc = "Open a buffer tab in a new vertical split with interactive picker",
        },
      }

      for key, mapping in pairs(keys2) do
        table.insert(keys, { key, mapping[1], desc = mapping.desc })
      end

      return keys
    end)(),
  },
}
