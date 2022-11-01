vim.o.termguicolors = true
vim.o.splitright = true --Vertical split on the right
vim.o.splitbelow = true --Horizontal split at the bottom
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2

-- Use treesitter for folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Autocomplete
vim.o.completeopt = "menu,menuone,noselect"

vim.g.mapleader = " "

-- Disable default plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plug in pairs(default_plugins) do
  vim.g["loaded_" .. plug] = true
end
