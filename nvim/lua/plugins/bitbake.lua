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
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= table then vim.list_extend(opts.ensure_installed, { "bitbake" }) end
    end,
  },
}
