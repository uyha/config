return {
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
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      if type(opts.groups.default) ~= "table" then return end

      local augend = require("dial.augend")
      vim.list_extend(opts.groups.default, {
        augend.date.alias["%Y-%m-%d"],
      })
      opts.groups = vim.tbl_extend("force", opts.groups, {
        zig = {
          augend.constant.new({
            elements = { "and", "or" },
            word = true,
            cyclic = true,
          }),
        },
      })
      opts.dials_by_ft = vim.tbl_extend("force", opts.dials_by_ft, { zig = "zig" })
    end,
  },
}
