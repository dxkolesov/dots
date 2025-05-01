return {
  {
    "tpope/vim-fugitive",
    -- close fugutive with <q>
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "fugitive",
        callback = function(event)
          vim.keymap.set("n", "q", "<cmd>close<CR>", {
            buffer = event.buf,
            silent = true,
            desc = "Close fugitive buffer",
          })
        end,
      })
    end,
    keys = {
      {
        "<leader>gi",
        "<cmd>vert Git<cr>",
        desc = "Fugitive (cwd)",
        silent = true,
      },

      {
        "<leader>gI",
        function()
          local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
          if git_root and vim.fn.isdirectory(git_root) == 1 then
            vim.cmd("lcd " .. git_root)
            vim.cmd("vert Git")
          else
            vim.notify("Not in a Git repository", vim.log.levels.WARN)
          end
        end,
        desc = "Fugitive (Root Dir)",
        silent = true,
      },
    },
  },
}
