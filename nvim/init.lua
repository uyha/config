local cmd = vim.cmd
local g = vim.g

g.mapleader = " "

require "plugins"
require "mappings"
require "options"
require "variables"
require "setup"
require "branch_mod"

cmd [[lang en_US.utf8]]
