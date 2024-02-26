return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if type(opts.servers) == "table" then vim.list_extend(opts.servers, {
        bashls = {},
      }) end
    end,
  },
}
