-- Adapted from https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g

local map = function(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

require 'options'
require 'plugins'
require 'treesitter'

cmd 'lang en_US.utf8'
cmd 'colorscheme onedark'

