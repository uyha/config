return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      vim.list_extend(opts.ensure_installed, {
        "harper-ls",
      })
    end,
  },
}
