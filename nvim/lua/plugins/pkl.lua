return {
  "nvim-treesitter/nvim-treesitter",

  dependencies = {
    "apple/pkl-neovim",
    lazy = true,
    event = {
      "BufReadPre *.pkl",
      "BufReadPre *.pcf",
      "BufReadPre PklProject",
    },
  },

  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "pkl" }) end
  end,
}
