local M = {}

M.setup = function()
  local navic = require "nvim-navic"
  require("feline").setup()

  require("feline").winbar.setup { components = components }
end

return M
