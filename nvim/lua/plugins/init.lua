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
  }
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.nvim-tree").setup {} end,
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    keys = {
      { "n", "<C-n>" },
      { "n", "<C-f>" },
    },
  }
  use {
    "akinsho/toggleterm.nvim",
    config = function() require("plugins.toggleterm").setup() end,
    cmd = { "ToggleTerm" },
    keys = {
      { "n", "<leader>lzg" },
      { "n", "<M-t>" },
    },
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    cmd = { "TSInstall", "TSInstallInfo", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
  }
end

local config = {
  display = {
    open_fn = require("packer.util").float,
  },
}

require("packer").startup { startup, config = config }
