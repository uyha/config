return {
  "nvim-neorg/neorg",
  dependencies = {
    "folke/zen-mode.nvim",
  },
  ft = "norg",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.completion"] = { config = { engine = "nvim-cmp" } },
      ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
      ["core.keybinds"] = { config = { neorg_leader = " " } },
    },
  },
}
