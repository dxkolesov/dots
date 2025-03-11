return {

  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },

  -- mellow
  -- {
  --   "mellow-theme/mellow.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     vim.g.mellow_highlight_overrides = {
  --       ["DiagnosticUnderlineError"] = { link = "DiagnosticError" },
  --       ["DiagnosticUnderlineWarn"] = { link = "DiagnosticWarn" },
  --       ["DiagnosticUnderlineInfo"] = { link = "DiagnosticInfo" },
  --       ["DiagnosticUnderlineHint"] = { link = "DiagnosticHint" },
  --
  --       ["SnacksIndent"] = { fg = "#323232" },
  --
  --       ["BlinkCmpMenuBorder"] = { link = "FoldColumn" },
  --       ["BlinkCmpMenu"] = { link = "Normal" },
  --       ["BlinkCmpDocBorder"] = { link = "FoldColumn" },
  --       ["BlinkCmpSignatureHelpBorder"] = { link = "FoldColumn" },
  --     }
  --
  --     vim.cmd.colorscheme("mellow")
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "mellow",
  --   },
  -- },

  -- astrotheme
  -- {
  --   "AstroNvim/astrotheme",
  --   lazy = false,
  --   config = true,
  --   priority = 1000,
  --   init = function()
  --     vim.cmd.colorscheme("astrodark")
  --
  --     local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
  --     local azure_fg = vim.api.nvim_get_hl(0, { name = "MiniIconsAzure" }).fg
  --     vim.api.nvim_set_hl(0, "BufferLineMiniIconsAzureSelected", { bg = normal_bg, fg = azure_fg })
  --     vim.api.nvim_set_hl(0, "BufferLineNumbersSelected", { bg = normal_bg })
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "astrodark",
  --   },
  -- },

  -- zenbones
  -- {
  --   "zenbones-theme/zenbones.nvim",
  --   -- dependencies = "rktjmp/lush.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.zenbones_compat = 1
  --
  --     vim.cmd.colorscheme("zenbones")
  --
  --     -- blink
  --     vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "Normal" })
  --     vim.api.nvim_set_hl(0, "BlinkCmpDoc", { link = "Normal" })
  --
  --     vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FoldColumn" })
  --     vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FoldColumn" })
  --     vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { link = "FoldColumn" })
  --     vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { link = "FoldColumn" })
  --
  --     vim.api.nvim_set_hl(0, "PMenuKind", { bg = "NONE" })
  --   end,
  -- },
  --
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "zenbones",
  --   },
  -- },

  -- habamax
  -- {
  --   "LazyVim/LazyVim",
  --   opts = function(_, opts)
  --     opts.colorscheme = "habamax"
  --     vim.api.nvim_create_autocmd("ColorScheme", {
  --       pattern = "*",
  --       callback = function()
  --         vim.api.nvim_set_hl(0, "VertSplit", { link = "CursorLineFold" })
  --         vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#323232" })
  --         vim.api.nvim_set_hl(0, "PMenu", { link = "Normal" })
  --         vim.api.nvim_set_hl(0, "Visual", { fg = "NONE", bg = "#494949" })
  --         vim.api.nvim_set_hl(0, "BufferlineNumbersSelected", { link = "CursorLineNr" })
  --         vim.api.nvim_set_hl(0, "Comment", { fg = "#767676", italic = true })
  --
  --         vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FoldColumn" })
  --         vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FoldColumn" })
  --         vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { link = "FoldColumn" })
  --       end,
  --     })
  --   end,
  -- },

  -- onedarkpro
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   init = function()
  --     vim.cmd("colorscheme onedark")
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "onedark",
  --   },
  -- },

  -- vague
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = "vague"
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "VertSplit", { link = "CursorLineFold" })
          vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#323232" })
          vim.api.nvim_set_hl(0, "StatusLine", { bg = "#333333" })
        end,
      })
    end,
  },

  -- rose-pine
  -- {
  --   "rose-pine/neovim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "main",
  --       palette = {
  --         main = {
  --           base = "#141415",
  --         },
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "rose-pine",
  --   },
  -- },
}
