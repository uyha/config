return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "main",
    keys = {
      { "<leader>vc", "<cmd>:VenvSelectCached<cr>", desc = "Select the previous venv for this project" },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) ~= "table" then return end

      local nls = require("null-ls")
      local builtins = nls.builtins
      local formatting = builtins.formatting

      vim.list_extend(opts.sources, {
        formatting.black,
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "black" },
    },
  },
}
