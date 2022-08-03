local M = {}

M.ui = { theme = "onedark" }

M.plugins = {
  user = {
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require("custom.null-ls").setup()
      end,
    },
    ["tpope/vim-abolish"] = {},
    ["tpope/vim-fugitive"] = {},
    ["tpope/vim-surround"] = {},
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
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.lspconfig",
    },
  },
  override = {
    ["kyazdani42/nvim-tree.lua"] = {
      actions = {
        open_file = {
          resize_window = false,
        },
      },
      git = {
        enable = true,
      },
    },
  },
  remove = {},
}

M.mappings = require "custom.mappings"
return M
