local utils = {}
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local opt = function(scope, key, value)
  scopes[scope][key] = value
  scopes['o'][key] = value
end
utils.opt = opt

local map = function(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
utils.map = map

return utils
