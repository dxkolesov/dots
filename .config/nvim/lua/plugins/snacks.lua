return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- input
      opts.input = { enabled = false }

      -- scroll
      opts.scroll = { enabled = false }

      -- indent
      opts.indent = { animate = { enabled = false } }

      -- picker
      opts.picker = {
        icons = {
          diagnostics = {
            Error = "E",
            Warn = "W",
            Hint = "H",
            Info = "I",
          },
        },

        sources = {
          explorer = {
            -- show hidden files in explorer
            hidden = true,
            -- explorer width
            layout = {
              layout = {
                width = 0.2,
              },
            },
          },
          -- show hidden files in files
          files = {
            hidden = true,
          },
        },
      }

      -- dashboard
      -- keys
      local new_keys = {
        {
          icon = " ",
          key = "b",
          desc = "Browse Repo",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        {
          {
            icon = "󰒲 ",
            key = "L",
            desc = "LazyVim Changelog",
            action = "<Leader>L",
            enabled = package.loaded.lazy ~= nil,
          },
        },
      }
      vim.list_extend(opts.dashboard.preset.keys, new_keys)

      -- header
      local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
      if #cwd > 60 then
        cwd = "..." .. cwd:sub(-57)
      end
      opts.dashboard.preset.header = {
        cwd,
      }

      -- sections
      opts.dashboard.sections = {
        { section = "header", padding = 1 },
        { section = "keys", gap = 1, padding = 2 },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Notifications",
              cmd = "gh notify -s -a -n5",
              action = function()
                vim.ui.open("https://github.com/notifications")
              end,
              key = "N",
              icon = " ",
              height = 5,
              enabled = true,
            },
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "p",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      }

      -- highlights
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "SnacksPickerTree", { link = "SnacksIndent" })
    end,
  },
}
