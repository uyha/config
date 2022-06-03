local M = {}

local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.general = {
   n = {
      ["<leader>e"] = {
         function()
            vim.diagnostic.open_float()
         end,
         " open diagnostic on a floating window"
      },
   },
   t = {
      ["<C-x>"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
   },
}

M.nvterm = {
   t = {
      ["<A-t>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
   },
   n = {
      ["<A-t>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
   },
}

M.disabled = {
   n = {
      ["<A-h>"] = "",
   },
   t = {
      ["jk"] = "",
      ["<A-h>"] = "",
   },
}

return M
