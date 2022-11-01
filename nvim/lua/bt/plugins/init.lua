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
  }

  -- use {
  --   "SmiteshP/nvim-navic",
  --   requires = { "neovim/nvim-lspconfig" },
  --   event = { "BufRead", "BufWinEnter", "BufNewFile" },
  -- }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup { flavour = "frappe" }
      vim.cmd [[colorscheme catppuccin-frappe]]
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
    setup = function()
      vim.api.nvim_create_autocmd({"BufRead"}, {
        group = vim.api.nvim_create_augroup("BTGitSignsLazyLoad", {}),
        callback = function()
          print("called")
          vim.fn.system("git rev-parse " .. vim.fn.expand("%:p:h"))
          -- if vim.v.shell_error == 0 then
          --   vim.api.nvim_del_augroup_by_name("BTGitSignsLazyLoad")
          --   vim.schedule(function()
          --     require("packer").loader("gitsigns.nvim")
          --   end)
          --   print("loaded")
          -- end
        end
      })
    end,
    config = function() 
      print("config called")
      require("gitsigns").setup() 
    end,
  }
  -- use {
  --   "numToStr/Comment.nvim",
  --   config = function() require("Comment").setup() end,
  --   event = { "VimEnter" },
  -- }
  -- use {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   requires = { "nvim-lua/plenary.nvim" },
  --   config = function() require("bt.plugins.null-ls").setup() end,
  --   event = { "BufRead", "BufWinEnter", "BufNewFile" },
  -- }

  -- use {
  --   "folke/noice.nvim",
  --   config = function()
  --     require("noice").setup {
  --       lsp = {
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true,
  --         },
  --       },
  --     }
  --   end,
  --   event = { "VimEnter" },
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- }
  -- use {
  --   "nvim-telescope/telescope.nvim",
  --   config = function() require("bt.plugins.telescope").setup() end,
  --   event = { "VimEnter" },
  --   requires = { "nvim-lua/plenary.nvim" },
  -- }
  -- use {
  --   "folke/which-key.nvim",
  --   config = function() require("which-key").setup() end,
  --   event = { "VimEnter" },
  -- }

  -- use {
  --   "hrsh7th/nvim-cmp",
  --   config = function() require("bt.plugins.nvim-cmp").setup() end,
  --   event = { "VimEnter" },
  -- }

  -- use { "L3MON4D3/LuaSnip", --[[ config = function() require("bt.plugins.luasnip").setup() end ,]] after = { "nvim-cmp" } }
  -- use { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip" } }

  -- use { "hrsh7th/cmp-nvim-lsp", after = { "cmp_luasnip" } }
  -- use { "hrsh7th/cmp-buffer", after = { "cmp-nvim-lsp" } }
  -- use { "hrsh7th/cmp-path", after = { "cmp-buffer" } }
  -- use { "hrsh7th/cmp-cmdline", after = { "cmp-path" } }

  -- use {
  --   "neovim/nvim-lspconfig",
  --   config = function() require("bt.plugins.nvim-lspconfig").setup() end,
  --   event = { "BufRead", "BufWinEnter", "BufNewFile" },
  --   cond = is_normal_file,
  --    after = { "cmp-nvim-lsp", "nvim-navic" },
  -- }

  -- use {
  --   "lukas-reineke/indent-blankline.nvim",
  --   config = function() require("indent_blankline").setup() end,
  --   event = { "BufRead", "BufWinEnter", "BufNewFile" },
  -- }

  -- use {
  --   "sindrets/diffview.nvim",
  --   requires = { "nvim-lua/plenary.nvim" },
  --   cmd = {
  --     "DiffviewOpen",
  --     "DiffviewFileHistory",
  --     "DiffviewClose",
  --     "DiffviewToggleFiles",
  --     "DiffviewFocusFiles",
  --     "DiffviewRefresh",
  --   },
  -- }

  -- use {
  --   "kylechui/nvim-surround",
  --   config = function() require("nvim-surround").setup {} end,
  --   event = { "VimEnter" },
  -- }

  -- use {
  --   "aserowy/tmux.nvim",
  --   config = function() require("tmux").setup() end,
  --   event = { "VimEnter" },
  -- }

  -- use {
  --   "p00f/nvim-ts-rainbow",
  --   after = { "nvim-treesitter" },
  --   requires = { "nvim-treesitter/nvim-treesitter" },
  -- }

  -- use { "kevinhwang91/nvim-bqf", ft = "qf" }
end

local config = {
  display = {
    open_fn = require("packer.util").float,
  },
}

require("packer").startup { startup, config = config }
