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
  use {
    "feline-nvim/feline.nvim",
    config = function() require("feline").setup() end,
    event = { "VimEnter" },
  }
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "mocha", -- mocha, macchiato, frappe, latte
      }
      vim.cmd [[colorscheme catppuccin]]
    end,
    event = { "VimEnter" },
  }
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function() require("nvim-tree").setup {} end,
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeRefresh" },
  }
  use {
    "akinsho/toggleterm.nvim",
    config = function() require("plugins.toggleterm").setup() end,
    keys = {
      { "n", "<leader>lzg" },
      { "n", "<M-t>" },
    },
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require("plugins.nvim-treesitter").setup() end,
    event = { "VimEnter" },
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end,
    event = { "VimEnter" },
  }
  use {
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
    event = { "VimEnter" },
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function() require("plugins.null-ls").setup() end,
    event = { "VimEnter" },
  }
  use {
    "neovim/nvim-lspconfig",
    config = function() require("plugins.nvim-lspconfig").setup() end,
    event = { "VimEnter" },
    after = { "cmp-nvim-lsp" },
  }
  use {
    "folke/noice.nvim",
    config = function() require("noice").setup() end,
    event = { "VimEnter" },
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  }
  use {
    "nvim-telescope/telescope.nvim",
    config = function() require("plugins.telescope").setup() end,
    event = { "VimEnter" },
    requires = { "nvim-lua/plenary.nvim" },
  }
  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup() end,
    event = { "VimEnter" },
  }
  use { "hrsh7th/nvim-cmp", config = function() require("plugins.nvim-cmp").setup() end }

  use { "hrsh7th/cmp-nvim-lsp", after = { "nvim-cmp" } }
  use { "hrsh7th/cmp-buffer", after = { "nvim-cmp" } }
  use { "hrsh7th/cmp-path", after = { "nvim-cmp" } }
  use { "hrsh7th/cmp-cmdline", after = { "nvim-cmp" } }

  use { "L3MON4D3/LuaSnip", after = { "nvim-cmp" } }
  use { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip" } }
end

local config = {
  display = {
    open_fn = require("packer.util").float,
  },
}

require("packer").startup { startup, config = config }
