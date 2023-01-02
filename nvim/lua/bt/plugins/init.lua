local M = {}

M.plugins = {
  -- UI Improvements
  {
    "feline-nvim/feline.nvim",
    config = function() require("bt.plugins.feline").setup() end,
    dependencies = { "nvim-navic", "catppuccin" },
  },
  { "SmiteshP/nvim-navic" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup { flavour = "mocha" }
      vim.cmd [[colorscheme catppuccin-mocha]]
    end,
  },
  { "NvChad/nvim-colorizer.lua", config = function() require("colorizer").setup() end },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("bt.plugins.indent-blankline").config() end,
    dependencies = { "nvim-treesitter", "catppuccin" },
  },
  {
    "folke/trouble.nvim",
    config = function() require("trouble").setup {} end,
    cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- UI Components
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("nvim-tree").setup {} end,
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeRefresh" },
  },
  {
    "folke/noice.nvim",
    config = function() require("bt.plugins.noice").config() end,
    event = { "UIEnter" },
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  },
  {
    "akinsho/toggleterm.nvim",
    config = function() require("bt.plugins.toggleterm").setup() end,
    keys = {
      { "<leader>lzg", mode = "n" },
      { "<M-t>", mode = "n" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function() require("bt.plugins.telescope").setup() end,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", mode = "n" },
      { "<leader>fa", mode = "n" },
      { "<leader>fw", mode = "n" },
      { "<leader>fk", mode = "n" },
    },
  },

  -- Git Integration
  {
    "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    config = require("bt.plugins.gitsigns").config,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
    },
  },

  -- Treesitter and friends
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.cmd [[TSUpdate]]
      require("bt.plugins.nvim-treesitter").setup()
    end,
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
  },
  { "nvim-treesitter/playground" },
  { "p00f/nvim-ts-rainbow", dependencies = { "nvim-treesitter" } },

  -- Editing
  {
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
    keys = {
      { "gc", mode = { "n" } },
      { "gb", mode = { "n" } },
      { "gc", mode = { "v" } },
      { "gb", mode = { "v" } },
    },
  },
  {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup {} end,
    keys = {
      { "ys", mode = "n" },
      { "S", mode = "n" },
      { "ds", mode = "n" },
      { "cs", mode = "n" },
      { "S", mode = "v" },
    },
  },
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end, event = "InsertEnter" },

  -- Language servers and completions
  {
    "jose-elias-alvarez/null-ls.nvim",
    name = "null-ls",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = require("bt.plugins.null-ls").setup,
    config = require("bt.plugins.null-ls").config,
  },
  {
    "neovim/nvim-lspconfig",
    config = function() require("bt.plugins.nvim-lspconfig").setup() end,
    dependencies = { "nvim-navic" },
  },
  { "hrsh7th/nvim-cmp", config = function() require("bt.plugins.nvim-cmp").setup() end, event = { "InsertEnter" } },
  { "L3MON4D3/LuaSnip", config = function() require("bt.plugins.luasnip").setup() end, dependencies = { "nvim-cmp" } },
  { "saadparwaiz1/cmp_luasnip", dependencies = { "LuaSnip" } },
  { "hrsh7th/cmp-nvim-lsp", dependencies = { "cmp_luasnip" } },
  { "hrsh7th/cmp-buffer", dependencies = { "cmp-nvim-lsp" } },
  { "hrsh7th/cmp-path", dependencies = { "cmp-buffer" } },
  { "hrsh7th/cmp-cmdline", dependencies = { "cmp-path" } },

  -- Miscellaneous
  { "folke/which-key.nvim", config = function() require("which-key").setup() end },
  {
    "aserowy/tmux.nvim",
    config = function() require("tmux").setup() end,
    keys = {
      { "<C-h>", mode = "n" },
      { "<C-j>", mode = "n" },
      { "<C-k>", mode = "n" },
      { "<C-l>", mode = "n" },
    },
  },
  { "mbbill/undotree", cmd = { "UndotreeToggle" } },
}

return M
