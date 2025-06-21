return {
  "greggh/claude-code.nvim",
  cmd = "ClaudeCode",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    window = {
      split_ratio = 0.32,
      position = "vertical",
    },
  },

  config = function(_, opts)
    require("claude-code").setup(opts)

    local target_width = math.floor(vim.o.columns * opts.window.split_ratio)
    local claude_win_id = nil

    local function preserve_claude_width()
      if claude_win_id and not vim.api.nvim_win_is_valid(claude_win_id) then
        claude_win_id = nil
      end

      if not claude_win_id then
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.api.nvim_buf_get_name(buf):match("claude%-code") then
            claude_win_id = win
            break
          end
        end
      end

      if claude_win_id and vim.api.nvim_win_get_width(claude_win_id) ~= target_width then
        vim.api.nvim_win_set_width(claude_win_id, target_width)
      end
    end

    vim.api.nvim_create_autocmd("WinResized", {
      group = vim.api.nvim_create_augroup("ClaudeCodeWidthPreserver", { clear = true }),
      callback = preserve_claude_width,
    })
  end,
}
