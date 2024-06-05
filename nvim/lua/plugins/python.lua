return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
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
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      vim.list_extend(opts.ensure_installed, {
        "black",
      })
    end,
  },
}
