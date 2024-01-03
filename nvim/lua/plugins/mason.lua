return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        -- Linters
        "actionlint",
        "luacheck",
        "shellcheck",
        "pylint",

        -- Formatters
        "black",
        "prettierd",
      })
    end
    opts.PATH = "skip"
  end,
}
