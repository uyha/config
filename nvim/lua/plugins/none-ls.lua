return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    if type(opts.sources) ~= "table" then return end

    local nls = require("null-ls")
    local builtins = nls.builtins
    local diagnostics = builtins.diagnostics

    vim.list_extend(opts.sources, {
      -- Github Action
      diagnostics.actionlint,
    })
  end,
}
