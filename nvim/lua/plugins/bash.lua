return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if type(opts.servers) == "table" then vim.list_extend(opts.servers, {
        bashls = {},
      }) end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= table then vim.list_extend(opts.ensure_installed, { "bash" }) end
    end,
  },
}
