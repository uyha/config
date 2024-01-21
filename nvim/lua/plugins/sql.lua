return {
  {
    "williamboman/mason.nvim",
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
        formatting.sqlfluff,
        diagnostics.sqlfluff,
      })
    end,
  },
}
