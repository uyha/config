return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.registries = {
        "lua:bearmason",
        "github:mason-org/mason-registry",
      }
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          -- Linters
          "actionlint",
        })
      end
      opts.PATH = "skip"
    end,
  },
}
