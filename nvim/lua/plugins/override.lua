return {
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ys",
        delete = "ds",
        replace = "cs",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", require("lazyvim.util").telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-o>"] = cmp.mapping(function(fallback)
          if not cmp.complete() then fallback() end
        end, { "i", "s" }),
      })
    end,
  },
}
