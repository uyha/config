return {
  "johmsalas/text-case.nvim",
  keys = {
    {
      "ccs",
      function() require("textcase").current_word("to_snake_case") end,
      mode = { "n", "v" },
      desc = "Change word to snake case",
    },
    {
      "cc-",
      function() require("textcase").current_word("to_dash_case") end,
      mode = { "n", "v" },
      desc = "Change word to dash case",
    },
    {
      "ccm",
      function() require("textcase").current_word("to_constant_case") end,
      mode = { "n", "v" },
      desc = "Change word to macro case",
    },
    {
      "ccc",
      function() require("textcase").current_word("to_camel_case") end,
      mode = { "n", "v" },
      desc = "Change word to camel case",
    },
    {
      "ccp",
      function() require("textcase").current_word("to_path_case") end,
      mode = { "n", "v" },
      desc = "Change word to path case",
    },
  },
}
