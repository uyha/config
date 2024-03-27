return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    if type(opts.sources) ~= "table" then return end

    local nls = require("null-ls")
    local builtins = nls.builtins
    local formatting = builtins.formatting
    local diagnostics = builtins.diagnostics

    vim.list_extend(opts.sources, {
      -- Web stuff
      formatting.prettierd.with({ extra_filetypes = { "svelte" } }),

      -- Lua
      formatting.stylua,

      -- Shell
      formatting.shfmt.with({ extra_args = { "-i", "2" } }),

      -- Github Action
      diagnostics.actionlint,
    })
  end,
}
