vim.cmd [[packadd packer.nvim]]
local startup = function(use)
  use {
    "wbthomason/packer.nvim",
    cmd = {
      "PackerSnapshot",
      "PackerSnapshotRollback",
      "PackerSnapshotDelete",
      "PackerInstall",
      "PackerUpdate",
      "PackerSync",
      "PackerClean",
      "PackerCompile",
      "PackerStatus",
      "PackerProfile",
      "PackerLoad",
    },
  }
  use { "lewis6991/impatient.nvim" }

  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function() require("nvim-tree").setup {} end,
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeRefresh" },
  }
  use {
    "feline-nvim/feline.nvim",
    config = function() require("bt.plugins.feline").setup() end,
    after = { "nvim-navic", "catppuccin" },
  }

  use { "SmiteshP/nvim-navic" }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup { flavour = "mocha" }
      vim.cmd [[colorscheme catppuccin-mocha]]
    end,
  }

  use {
    "akinsho/toggleterm.nvim",
    config = function() require("bt.plugins.toggleterm").setup() end,
    keys = {
      { "n", "<leader>lzg" },
      { "n", "<M-t>" },
    },
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require("bt.plugins.nvim-treesitter").setup() end,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
  }

  use {
    "lewis6991/gitsigns.nvim",
    module = "gitsigns",
    setup = require("bt.plugins.gitsigns").setup,
    config = require("bt.plugins.gitsigns").config,
  }
  use {
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
    keys = {
      { "n", "gc" },
      { "n", "gb" },
      { "v", "gc" },
      { "v", "gb" },
    },
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    module = "null-ls",
    requires = { "nvim-lua/plenary.nvim" },
    setup = require("bt.plugins.null-ls").setup,
    config = require("bt.plugins.null-ls").config,
  }

  use {
    "folke/noice.nvim",
    config = function() require("bt.plugins.noice").config() end,
    event = { "UIEnter" },
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  }
  use {
    "nvim-telescope/telescope.nvim",
    config = function() require("bt.plugins.telescope").setup() end,
    requires = { "nvim-lua/plenary.nvim" },
    keys = {
      { "n", "<leader>ff" },
      { "n", "<leader>fa" },
      { "n", "<leader>fw" },
      { "n", "<leader>fk" },
    },
  }

  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup() end,
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function() require("bt.plugins.nvim-cmp").setup() end,
    event = { "InsertEnter" },
  }

  use {
    "L3MON4D3/LuaSnip",
    config = function() require("bt.plugins.luasnip").setup() end,
    after = { "nvim-cmp" },
  }
  use { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip" } }

  use { "hrsh7th/cmp-nvim-lsp", after = { "cmp_luasnip" } }
  use { "hrsh7th/cmp-buffer", after = { "cmp-nvim-lsp" } }
  use { "hrsh7th/cmp-path", after = { "cmp-buffer" } }
  use { "hrsh7th/cmp-cmdline", after = { "cmp-path" } }

  use {
    "neovim/nvim-lspconfig",
    config = function() require("bt.plugins.nvim-lspconfig").setup() end,
    after = { "nvim-navic" },
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("bt.plugins.indent-blankline").config() end,
    after = { "nvim-treesitter", "catppuccin" },
  }

  use {
    "sindrets/diffview.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
    },
  }

  use {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup {} end,
    keys = {
      { "n", "ys" },
      { "n", "S" },
      { "n", "ds" },
      { "n", "cs" },
      { "v", "S" },
    },
  }

  use {
    "aserowy/tmux.nvim",
    config = function() require("tmux").setup() end,
    keys = {
      { "n", "<C-h>" },
      { "n", "<C-j>" },
      { "n", "<C-k>" },
      { "n", "<C-l>" },
    },
  }

  use {
    "p00f/nvim-ts-rainbow",
    after = { "nvim-treesitter" },
  }

  use { "kevinhwang91/nvim-bqf", ft = "qf" }
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end, event = "InsertEnter" }
  use { "NvChad/nvim-colorizer.lua", config = function() require("colorizer").setup() end }
end

local config = {
  display = {
    open_fn = require("packer.util").float,
  },
}

require("packer").startup { startup, config = config }
