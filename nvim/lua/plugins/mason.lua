return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Linters
      "actionlint",
      "luacheck",
      "shellcheck",
      "pylint",
      "flake8",

      -- Formatters
      "black",
      "prettierd",
      "shfmt",
    },
  },
}
