local M = {}

local function add_snippets()
   local ls = require "luasnip"
   local s = ls.snippet
   local sn = ls.snippet_node
   local isn = ls.indent_snippet_node
   local t = ls.text_node
   local i = ls.insert_node
   local f = ls.function_node
   local c = ls.choice_node
   local d = ls.dynamic_node
   local r = ls.restore_node
   local events = require "luasnip.util.events"
   local ai = require "luasnip.nodes.absolute_indexer"
   local fmt = require("luasnip.extras.fmt").fmt
   local m = require("luasnip.extras").m
   local lambda = require("luasnip.extras").l

   -- stylua: ignore start
   ls.add_snippets("cmake", {
      s("project", {
         t { "cmake_minimum_required(VERSION " }, i(1, "3.21"), t { ")", "" },
         t { "project(" }, i(2, "Project Name"), t { " VERSION " }, i(3, "0.1"), t { " LANGUAGES " }, i(4, "CXX"), t { ")", "", "" },
         t { [[list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")]] },
      }),
   })
   -- stylua: ignore end
end

M.setup = function()
   require("plugins.configs.others").luasnip()
   require("luasnip.loaders.from_snipmate").load {
      paths = { "~/.config/nvcustom/snippets" },
   }
   add_snippets()
end

return M
