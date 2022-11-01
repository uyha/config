pcall(require, "impatient")

require "bt.options"
require "bt.mappings"

local should_sync = require("bt.plugins.utils").ensure_packer()

require "bt.plugins"

if should_sync then vim.cmd [[PackerSync]] end
