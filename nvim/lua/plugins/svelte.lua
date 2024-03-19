return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if type(opts.servers) ~= "table" then return end

      vim.tbl_extend("force", opts.servers, { svelte = {} })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == table then vim.list_extend(opts.ensure_installed, { "svelte" }) end
    end,
  },
}
