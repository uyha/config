local cmd = vim.cmd
local completion = require 'completion'
local utils = require 'utils'
local map, opt = {utils.map, utils.opt}

cmd "autocmd BufEnter * lua require'completion'.on_attach()"
