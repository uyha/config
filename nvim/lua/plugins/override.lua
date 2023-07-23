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
}
