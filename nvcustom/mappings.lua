local M = {}

local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.general = {
   n = {
      ["<leader>g"] = { "<cmd>:G ++curwin<CR>", " open git" },
   },
   t = {
      ["jk"] = "",
      ["<C-x>"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
   },
}

M.nvterm = {
   t = {
      ["<A-h>"] = "",
      ["<A-t>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
   },
   n = {
      ["<A-h>"] = "",
      ["<A-t>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
   },
}

return M
