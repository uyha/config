return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      vim.list_extend(opts.ensure_installed, { "cmake" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if type(opts.servers) ~= "table" then return end

      opts.servers = vim.tbl_extend("force", opts.servers, { neocmake = {} })
    end,
  },
}
