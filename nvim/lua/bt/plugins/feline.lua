local M = {}

local components = {}
components.statusline = function(palatte)
  return {
    active = {
      {
        {
          provider = "▊ ",
          hl = { fg = palatte.lavender },
        },
        {
          provider = "file_info",
          hl = { fg = palatte.text, bg = palatte.surface2, style = "bold" },
          left_sep = {
            "slant_left_2",
            { str = " ", hl = { bg = palatte.surface2, fg = "NONE" } },
          },
          right_sep = {
            { str = " ", hl = { bg = palatte.surface2, fg = "NONE" } },
            "slant_right_2",
            " ",
          },
        },
        {
          provider = "file_size",
          right_sep = {
            " ",
            { str = "slant_left_2_thin", hl = { fg = "fg", bg = "bg" } },
          },
        },
        {
          provider = "position",
          left_sep = " ",
          right_sep = { " ", { str = "slant_right_2_thin", hl = { fg = "fg", bg = "bg" } } },
        },
        {
          provider = "diagnostic_errors",
          hl = { fg = palatte.red },
        },
        {
          provider = "diagnostic_warnings",
          hl = { fg = palatte.yellow },
        },
        {
          provider = "diagnostic_hints",
          hl = { fg = palatte.teal },
        },
        {
          provider = "diagnostic_info",
          hl = { fg = palatte.blue },
        },
      },
      {
        {
          provider = "lsp_client_names",
          hl = { fg = palatte.text, bg = palatte.surface2, style = "bold" },
          left_sep = {
            "slant_left_2",
            { str = " ", hl = { bg = palatte.surface2, fg = "NONE" } },
          },
          right_sep = {
            { str = " ", hl = { bg = palatte.surface2, fg = "NONE" } },
            "slant_right_2",
            " ",
          },
        },
        {
          provider = "git_branch",
          hl = { fg = "white", bg = "bg", style = "bold" },
          left_sep = {
            str = " ",
            hl = { fg = "NONE", bg = "bg" },
          },
          right_sep = {
            str = " ",
            hl = { fg = "NONE", bg = "bg" },
          },
        },
        {
          provider = "git_diff_added",
          hl = { fg = "green", bg = "bg" },
        },
        {
          provider = "git_diff_changed",
          hl = { fg = "orange", bg = "bg" },
        },
        {
          provider = "git_diff_removed",
          hl = { fg = "red", bg = "bg" },
          right_sep = {
            str = " ",
            hl = { fg = "NONE", bg = "bg" },
          },
        },
        {
          provider = "line_percentage",
          hl = { style = "bold" },
          left_sep = "  ",
          right_sep = " ",
        },
        {
          provider = "scroll_bar",
          hl = { fg = palatte.blue, style = "bold" },
        },
      },
    },
    inactive = {
      {
        {
          provider = "▊ ",
          enabled = function() return vim.bo.filetype ~= "NvimTree" end,
          hl = { fg = palatte.lavender },
        },
        {
          provider = "file_info",
          enabled = function() return vim.bo.filetype ~= "NvimTree" end,
          hl = { fg = palatte.text, bg = palatte.surface2, style = "bold" },
          left_sep = {
            "slant_left_2",
            { str = " ", hl = { bg = palatte.surface2, fg = "NONE" } },
          },
          right_sep = {
            { str = " ", hl = { bg = palatte.surface2, fg = "NONE" } },
            "slant_right_2",
            " ",
          },
        },
      },
      {},
    },
  }
end

components.winbar = function(palatte)
  return {
    active = {
      {
        {
          provider = "file_type",
          hl = { fg = palatte.text, bg = palatte.base, style = "bold" },
          left_sep = { "  " },
          right_sep = { "  " },
        },
        {
          provider = function() return require("nvim-navic").get_location() end,
          enabled = function() return require("nvim-navic").is_available() end,
          hl = { fg = palatte.text, bg = palatte.base, style = "bold" },
        },
        {},
      },
    },
    inactive = {
      {
        {
          provider = "file_type",
          hl = { fg = palatte.text, bg = palatte.base, style = "bold" },
          left_sep = { "  " },
        },
      },
    },
  }
end

M.setup = function()
  local palatte = require("catppuccin.palettes").get_palette()
  require("feline").setup { components = components.statusline(palatte) }
  require("feline").winbar.setup { components = components.winbar(palatte) }
end

return M
