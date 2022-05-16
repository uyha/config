local M = {}

M.nvterm = {
   t = {
      ["<A-i>"] = {
         function()
            require("nvterm.terminal").toggle "float"
         end,
         "   toggle floating term",
      },
      ["<A-t>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
      ["<A-v>"] = {
         function()
            require("nvterm.terminal").toggle "vertical"
         end,
         "   toggle vertical term",
      },
   },
   n = {
      ["<A-i>"] = {
         function()
            require("nvterm.terminal").toggle "float"
         end,
         "   toggle floating term",
      },
      ["<A-t>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
      ["<A-v>"] = {
         function()
            require("nvterm.terminal").toggle "vertical"
         end,
         "   toggle vertical term",
      },
      ["<leader>h"] = {
         function()
            require("nvterm.terminal").new "horizontal"
         end,
         "   new horizontal term",
      },
      ["<leader>v"] = {
         function()
            require("nvterm.terminal").new "vertical"
         end,
         "   new vertical term",
      },
   },
}

return M
