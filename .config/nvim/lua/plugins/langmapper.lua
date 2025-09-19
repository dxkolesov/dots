local function langmap_set()
  local escape = function(str)
    local escape_chars = [[;,."|\]]
    return vim.fn.escape(str, escape_chars)
  end

  local en = [[\qwertyuiop[]asdfghjkl;'zxcvbnm]]
  local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
  local en_shift = [[|QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
  local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

  local langmap = vim.fn.join({
    escape(ru) .. ";" .. escape(en),
    escape(ru_shift) .. ";" .. escape(en_shift),
  }, ",")

  vim.fn.langmap = langmap
end

local function getcharstr_hack()
  local getcharstr_original = vim.fn.getcharstr
  local getcharstr_override = function(expr)
    if expr ~= nil then
      return getcharstr_original(expr)
    end

    local char = getcharstr_original()

    local ok, lm = pcall(require, "langmapper.utils")

    if not ok then
      return char
    end

    return lm.translate_keycode(char, "default", "ru")
  end

  vim.fn.getcharstr = getcharstr_override
end

local function langmapper_automapping_on_start()
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      require("langmapper").automapping()
    end,
  })
end

return {

  {
    "Wansmer/langmapper.nvim",
    dependencies = { "LazyVim/LazyVim" },
    lazy = false,
    priority = 1,
    vscode = true,

    opts = {
      default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}~abcdefghijklmnopqrstuvwxyz,.;'[]\]],

      layouts = {
        ru = {
          id = "com.apple.keylayout.Russian",
          layout = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪËфисвуапршолдьтщзйкыегмцчнябюжэхъё",
        },
      },
    },

    config = function(_, opts)
      local lm = require("langmapper")

      lm.setup(opts)
      lm.hack_get_keymap()
    end,
  },

  { "LazyVim/LazyVim", opts = langmap_set },
  { "Wansmer/langmapper.nvim", opts = getcharstr_hack },
  { "Wansmer/langmapper.nvim", opts = langmapper_automapping_on_start },

  {
    "folke/which-key.nvim",
    optional = true,

    opts = function(_, opts)
      local translate_key = require("langmapper.utils").translate_keycode

      opts.filter = function(mapping)
        return mapping.lhs
          and mapping.lhs == translate_key(mapping.lhs, "default", "ru")
          and mapping.desc
          and mapping.desc:find("LM") == nil
      end
    end,
  },

  {
    "folke/snacks.nvim",
    optional = true,
    opts = function(_, _)
      local translate_key = require("langmapper.utils").translate_keycode
      local normkey_orig = Snacks.util.normkey

      Snacks.util.normkey = function(key)
        if key then
          key = translate_key(key, "default", "ru")
        end

        return normkey_orig(key)
      end
    end,
  },
}
