return {
  "johmsalas/text-case.nvim",
  keys = {
    { "ccs", function() require("textcase").current_word("to_snake_case") end, desc = "Change word to snake case" },
    { "cc-", function() require("textcase").current_word("to_dash_case") end, desc = "Change word to dash case" },
    { "ccm", function() require("textcase").current_word("to_constant_case") end, desc = "Change word to macro case" },
    { "ccc", function() require("textcase").current_word("to_camel_case") end, desc = "Change word to camel case" },
    { "ccp", function() require("textcase").current_word("to_path_case") end, desc = "Change word to path case" },
  },
}
