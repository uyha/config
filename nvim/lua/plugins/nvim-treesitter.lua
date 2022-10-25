local M = {}

M.setup = function()
  require("nvim-treesitter.configs").setup {
    highlight = { enable = true, additional_vim_regex_highlighting = false },
  }
end

return M
