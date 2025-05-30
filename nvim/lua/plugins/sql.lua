return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      vim.list_extend(opts.ensure_installed, { "sql" })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      vim.list_extend(opts.ensure_installed, {
        "sqlfluff",
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) ~= "table" then return end

      local nls = require("null-ls")
      local builtins = nls.builtins
      local formatting = builtins.formatting
      local diagnostics = builtins.diagnostics

      vim.list_extend(opts.sources, {
        formatting.sqlfluff.with({ timeout = 5000 }),
        diagnostics.sqlfluff,
      })
    end,
  },
}
