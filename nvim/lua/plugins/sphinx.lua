return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      -- The tree-sitter parser for rst is incomplete, hence removing it to be less
      -- annoying
      for index, value in ipairs(opts.ensure_installed) do
        if value == "rst" then
          table.remove(opts.ensure_installed, index)
          break
        end
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if type(opts.servers) ~= "table" then return end

      vim.tbl_extend("force", opts.servers, { esbonio = {} })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      vim.list_extend(opts.ensure_installed, { "esbonio" })
    end,
  },
}
