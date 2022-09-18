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
      " open diagnostic on a floating window",
    },
    ["<leader>."] = {
      function()
        vim.cmd "vertical resize +10"
      end,
      "Narrow the current window",
    },
    ["<leader>,"] = {
      function()
        vim.cmd "vertical resize -10"
      end,
      "Widen the current window",
    },
    ["<leader>="] = {
      function()
        vim.cmd "resize +10"
      end,
      "Increase the height of current window",
    },
    ["<leader>-"] = {
      function()
        vim.cmd "resize -10"
      end,
      "Decrease the height of current window",
    },
    ["<A-n>"] = { "<cmd> cn <CR>", "Jump to next item in the Quickfix list" },
    ["<A-p>"] = { "<cmd> cp <CR>", "Jump to next item in the Quickfix list" },
  },
  t = {
    ["<Esc>"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
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
    ["<C-h>"] = { "<cmd> wincmd h <CR>" },
    ["<C-j>"] = { "<cmd> wincmd j <CR>" },
    ["<C-k>"] = { "<cmd> wincmd k <CR>" },
    ["<C-l>"] = { "<cmd> wincmd l <CR>" },
  },
  n = {
    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "   toggle horizontal term",
    },
    ["<C-h>"] = { "<cmd> wincmd h <CR>" },
    ["<C-j>"] = { "<cmd> wincmd j <CR>" },
    ["<C-k>"] = { "<cmd> wincmd k <CR>" },
    ["<C-l>"] = { "<cmd> wincmd l <CR>" },
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
