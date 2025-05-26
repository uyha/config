return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= table then vim.list_extend(opts.ensure_installed, { "bash" }) end
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) ~= "table" then return end

      local nls = require("null-ls")

      vim.list_extend(opts.sources, {
        nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "2" } }),
      })
    end,
  },
}
