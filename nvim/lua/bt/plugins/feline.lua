local M = {}

local left_component = {
  {
    provider = "▊ ",
    hl = {
      fg = "skyblue",
    },
  },
  {
    provider = "file_info",
    hl = {
      fg = "white",
      bg = "oceanblue",
      style = "bold",
    },
    left_sep = {
      "slant_left_2",
      { str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
    },
    right_sep = {
      { str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
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
    hl = { fg = "red" },
  },
  {
    provider = "diagnostic_warnings",
    hl = { fg = "yellow" },
  },
  {
    provider = "diagnostic_hints",
    hl = { fg = "cyan" },
  },
  {
    provider = "diagnostic_info",
    hl = { fg = "skyblue" },
  },
}
local right_component = {
  {
    provider = "git_branch",
    hl = {
      fg = "white",
      bg = "black",
      style = "bold",
    },
    right_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = "black",
      },
    },
  },
  {
    provider = "git_diff_added",
    hl = {
      fg = "green",
      bg = "black",
    },
  },
  {
    provider = "git_diff_changed",
    hl = {

      fg = "orange",
      bg = "black",
    },
  },
  {
    provider = "git_diff_removed",
    hl = {
      fg = "red",
      bg = "black",
    },
    right_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = "black",
      },
    },
  },
  {
    provider = "line_percentage",
    hl = {
      style = "bold",
    },
    left_sep = "  ",
    right_sep = " ",
  },
  {
    provider = "scroll_bar",
    hl = {
      fg = "skyblue",
      style = "bold",
    },
  },
}
local inactive_left_component = {
  {
    provider = "file_type",
    hl = {
      fg = "white",
      bg = "oceanblue",
      style = "bold",
    },
    left_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = "oceanblue",
      },
    },
    right_sep = {
      {
        str = " ",
        hl = {
          fg = "NONE",
          bg = "oceanblue",
        },
      },
      "slant_right",
    },
  },
  -- Empty component to fix the highlight till the end of the statusline

  {},
}

M.setup = function()
  require("feline").setup {
    components = {
      active = {
        left_component,
        right_component,
      },
      inactive = { inactive_left_component },
    },
  }
  require("feline").winbar.setup()
end

return M
