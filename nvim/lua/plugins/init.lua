local ensure_packer = function()
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    return true
  end
  return false
end

local should_sync = ensure_packer()

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
    config = function()
      require("feline").setup()
      require("feline").winbar.setup()
    end,
    event = { "VimEnter" },
  }
  use {
    "folke/tokyonight.nvim",
    config = function() vim.cmd [[colorscheme tokyonight]] end,
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
    "folke/noice.nvim",
    config = function()
      require("noice").setup {
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
      }
    end,
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
  use { "hrsh7th/nvim-cmp", config = function() require("plugins.nvim-cmp").setup() end, event = { "VimEnter" } }

  use { "L3MON4D3/LuaSnip", config = function() require("plugins.luasnip").setup() end, after = { "nvim-cmp" } }
  use { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip" } }

  use { "hrsh7th/cmp-nvim-lsp", after = { "cmp_luasnip" } }
  use { "hrsh7th/cmp-buffer", after = { "cmp-nvim-lsp" } }
  use { "hrsh7th/cmp-path", after = { "cmp-buffer" } }
  use { "hrsh7th/cmp-cmdline", after = { "cmp-path" } }

  use {
    "neovim/nvim-lspconfig",
    config = function() require("plugins.nvim-lspconfig").setup() end,
    after = { "cmp-nvim-lsp" },
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("indent_blankline").setup() end,
    event = { "VimEnter" },
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

  if should_sync then require("packer").sync() end
end

local config = {
  display = {
    open_fn = require("packer.util").float,
  },
}

require("packer").startup { startup, config = config }
