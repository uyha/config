return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      -- The tree-sitter parser for RST is incomplete, hence removing it to be less
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
    opts = {
      servers = {
        esbonio = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "esbonio" },
    },
  },
}
