return {
  "johmsalas/text-case.nvim",
  keys = {
    {
      "<leader>cs",
      function() require("textcase").current_word("to_snake_case") end,
      mode = { "n", "v" },
      desc = "Change word to snake case",
    },
    {
      "<leader>c-",
      function() require("textcase").current_word("to_dash_case") end,
      mode = { "n", "v" },
      desc = "Change word to dash case",
    },
    {
      "<leader>cm",
      function() require("textcase").current_word("to_constant_case") end,
      mode = { "n", "v" },
      desc = "Change word to macro case",
    },
    {
      "<leader>cc",
      function() require("textcase").current_word("to_camel_case") end,
      mode = { "n", "v" },
      desc = "Change word to camel case",
    },
    {
      "<leader>cp",
      function() require("textcase").current_word("to_path_case") end,
      mode = { "n", "v" },
      desc = "Change word to path case",
    },
  },
}
