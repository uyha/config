local M = {}

M.config = function()
  local palette = require("catppuccin.palettes").get_palette()

  vim.cmd([[highlight IndentBlanklineIndent1 guifg=]] .. palette.rosewater .. [[ gui=nocombine]])
  vim.cmd([[highlight IndentBlanklineIndent2 guifg=]] .. palette.green .. [[ gui=nocombine]])
  vim.cmd([[highlight IndentBlanklineIndent3 guifg=]] .. palette.peach .. [[ gui=nocombine]])
  vim.cmd([[highlight IndentBlanklineIndent4 guifg=]] .. palette.maroon .. [[ gui=nocombine]])
  vim.cmd([[highlight IndentBlanklineIndent5 guifg=]] .. palette.blue .. [[ gui=nocombine]])

  vim.opt.list = true
  vim.opt.listchars:append "space:⋅"
  vim.opt.listchars:append "eol:↴"

  require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
    },
  }
end

return M
