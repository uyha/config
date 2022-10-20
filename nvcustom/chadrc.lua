local M = {}

M.ui = { theme = "onedark" }

M.plugins = {
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.null-ls").setup()
    end,
  },
  ["tpope/vim-abolish"] = {},
  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup()
    end,
  },
  ["L3MON4D3/LuaSnip"] = {
    after = "nvim-cmp",
    config = function()
      require("custom.luasnip").setup()
    end,
  },
  ["hrsh7th/nvim-cmp"] = {
    config = function()
      require "plugins.configs.cmp"
    end,
  },
  ["wgwoods/vim-systemd-syntax"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.lspconfig"
    end,
  },
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = {
      actions = {
        open_file = {
          resize_window = false,
        },
      },
      view = {
        adaptive_size = false,
      },
      git = {
        enable = true,
      },
    },
  },
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  ["sindrets/diffview.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
  },
  ["nvim-lua/plenary.nvim"] = { rm_default_opts = true },
}

M.mappings = require "custom.mappings"
return M
