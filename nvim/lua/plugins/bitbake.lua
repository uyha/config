return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bitbake_ls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      vim.list_extend(opts.ensure_installed, { "language-server-bitbake" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= table then vim.list_extend(opts.ensure_installed, { "bitbake" }) end
    end,
  },
}
