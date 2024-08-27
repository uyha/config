return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      servers = {
        cmake = {},
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if type(opts.servers) ~= "table" then return end

      vim.tbl_extend("force", opts.servers, { neocmake = {} })
    end,
  },
}
