return {
  "johmsalas/text-case.nvim",
  keys = {
    {
      "<leader>Cs",
      function() require("textcase").current_word("to_snake_case") end,
      mode = { "n", "v" },
      desc = "Change word to snake case",
    },
    {
      "<leader>C-",
      function() require("textcase").current_word("to_dash_case") end,
      mode = { "n", "v" },
      desc = "Change word to dash case",
    },
    {
      "<leader>Cm",
      function() require("textcase").current_word("to_constant_case") end,
      mode = { "n", "v" },
      desc = "Change word to macro case",
    },
    {
      "<leader>Cc",
      function() require("textcase").current_word("to_camel_case") end,
      mode = { "n", "v" },
      desc = "Change word to camel case",
    },
    {
      "<leader>Cp",
      function() require("textcase").current_word("to_path_case") end,
      mode = { "n", "v" },
      desc = "Change word to path case",
    },
  },
}
