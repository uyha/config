pcall(require, "impatient")

require "bt.options"
require "bt.keymaps"
require "bt.autocmds"

require("bt.plugins.utils").ensure_lazynvim()

require("lazy").setup(require("bt.plugins").plugins)
