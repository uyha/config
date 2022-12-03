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

  -- UI Improvements
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
  use { "NvChad/nvim-colorizer.lua", config = function() require("colorizer").setup() end }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("bt.plugins.indent-blankline").config() end,
    after = { "nvim-treesitter", "catppuccin" },
  }
  use {
    "folke/trouble.nvim",
    config = function() require("trouble").setup {} end,
    cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  -- UI Components
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function() require("nvim-tree").setup {} end,
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeRefresh" },
  }
  use {
    "folke/noice.nvim",
    config = function() require("bt.plugins.noice").config() end,
    event = { "UIEnter" },
    requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
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

  -- Git Integration
  use {
    "lewis6991/gitsigns.nvim",
    module = "gitsigns",
    setup = require("bt.plugins.gitsigns").setup,
    config = require("bt.plugins.gitsigns").config,
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

  -- Treesitter and friends
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require("bt.plugins.nvim-treesitter").setup() end,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
  }
  use { "nvim-treesitter/playground" }
  use { "p00f/nvim-ts-rainbow", after = { "nvim-treesitter" } }

  -- Editing
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
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end, event = "InsertEnter" }

  -- Language servers and completions
  use {
    "jose-elias-alvarez/null-ls.nvim",
    module = "null-ls",
    requires = { "nvim-lua/plenary.nvim" },
    setup = require("bt.plugins.null-ls").setup,
    config = require("bt.plugins.null-ls").config,
  }
  use {
    "neovim/nvim-lspconfig",
    config = function() require("bt.plugins.nvim-lspconfig").setup() end,
    after = { "nvim-navic" },
  }
  use { "hrsh7th/nvim-cmp", config = function() require("bt.plugins.nvim-cmp").setup() end, event = { "InsertEnter" } }
  use { "L3MON4D3/LuaSnip", config = function() require("bt.plugins.luasnip").setup() end, after = { "nvim-cmp" } }
  use { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip" } }
  use { "hrsh7th/cmp-nvim-lsp", after = { "cmp_luasnip" } }
  use { "hrsh7th/cmp-buffer", after = { "cmp-nvim-lsp" } }
  use { "hrsh7th/cmp-path", after = { "cmp-buffer" } }
  use { "hrsh7th/cmp-cmdline", after = { "cmp-path" } }

  -- Miscellaneous
  use { "folke/which-key.nvim", config = function() require("which-key").setup() end }
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
end

local config = {
  display = {
    open_fn = require("packer.util").float,
  },
}

require("packer").startup { startup, config = config }
