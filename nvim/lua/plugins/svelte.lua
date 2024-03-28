return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svelte = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "svelte" }) end
    end,
  },
}
