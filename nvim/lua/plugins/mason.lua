return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        -- Linters
        "actionlint",

        -- Formatters
        "prettierd",
      })
    end
    opts.PATH = "skip"
  end,
}
