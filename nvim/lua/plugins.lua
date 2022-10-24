local treesitter_cmds = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" }
local packer_cmds = {
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
}

vim.cmd [[packadd packer.nvim]]
local startup = function(use)
  use { "wbthomason/packer.nvim", cmd = packer_cmds }
  use {
    "feline-nvim/feline.nvim",
    config = function()
      require("feline").setup()
    end,
  }
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {}
    end,
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
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
  }
end

local config = {
  display = {
    open_fn = require("packer.util").float,
  },
}

require("packer").startup { startup, config = config }
