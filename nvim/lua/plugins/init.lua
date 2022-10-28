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
      vim.api.nvim_command "colorscheme catppuccin"
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
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSBufEnable",
      "TSBufDisable",
      "TSEnable",
      "TSDisable",
      "TSModuleInfo",
      "TSUpdate",
    },
    config = function() require("plugins.nvim-treesitter").setup() end,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    cond = require("plugins.utils").is_normal_file,
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    cond = require("plugins.utils").is_normal_file,
  }
  use {
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    cond = require("plugins.utils").is_normal_file,
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function() require("plugins.null-ls").setup() end,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    cond = require("plugins.utils").is_normal_file,
  }
  use {
    "neovim/nvim-lspconfig",
    config = function() require("plugins.nvim-lspconfig").setup() end,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    cond = require("plugins.utils").is_normal_file,
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
    event = { "VimEnter" },
    requires = { { "folke/which-key.nvim", "nvim-lua/plenary.nvim" } },
  }
end

local config = {
  display = {
    open_fn = require("packer.util").float,
  },
}

require("packer").startup { startup, config = config }
