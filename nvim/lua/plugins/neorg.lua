return {
  "nvim-neorg/neorg",
  dependencies = { "folke/zen-mode.nvim" },
  ft = "norg",
  opts = {
    load = {
      ["core.concealer"] = {},
      ["core.defaults"] = {},
      ["core.export"] = {},
      ["core.keybinds"] = { config = { neorg_leader = " " } },
      ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
    },
  },
}
