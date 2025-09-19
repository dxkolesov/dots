return {
  -- better quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {},
  },

  -- replace in quickfix
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    opts = {},
    keys = {
      {
        "<leader>xq",
        function()
          require("quicker").toggle({
            focus = true,
            open_cmd_mods = { split = "belowright" },
          })
        end,
        desc = "Toggle quickfix list",
      },

      {
        "<leader>xl",
        function()
          require("quicker").toggle({
            focus = true,
            loclist = true,
            open_cmd_mods = { split = "belowright" },
          })
        end,
        desc = "Toggle quickfix list",
      },
    },
  },

  -- quickfix actions for snacks picker
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- open quicker quickfix list
      local actions = require("snacks.picker.actions")
      local setqflist = function(items, opts)
        local qf = {} ---@type vim.quickfix.entry[]
        for _, item in ipairs(items) do
          qf[#qf + 1] = {
            filename = require("snacks").picker.util.path(item),
            bufnr = item.buf,
            lnum = item.pos and item.pos[1] or 1,
            col = item.pos and item.pos[2] + 1 or 1,
            end_lnum = item.end_pos and item.end_pos[1] or nil,
            end_col = item.end_pos and item.end_pos[2] + 1 or nil,
            text = item.line or item.comment or item.label or item.name or item.detail or item.text,
            pattern = item.search,
            valid = true,
          }
        end
        if opts and opts.win then
          vim.fn.setloclist(opts.win, qf)
          require("quicker").open({
            focus = true,
            loclist = true,
            open_cmd_mods = { split = "belowright" },
          })
        else
          vim.fn.setqflist(qf)
          require("quicker").open({
            focus = true,
            open_cmd_mods = { split = "belowright" },
          })
        end
      end

      actions.qflist = function(picker)
        picker:close()
        local sel = picker:selected()
        local items = #sel > 0 and sel or picker:items()
        setqflist(items)
      end

      actions.qflist_all = function(picker)
        picker:close()
        setqflist(picker:items())
      end

      return opts
    end,
  },
}
