return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            },
          },
        },
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["<C-g>"] = function()
                    local explorers = Snacks.picker.get({ source = "explorer" })
                    if #explorers ~= 0 then
                      explorers[1]:action("confirm")
                      explorers[1]:close()
                    end
                  end,
                  ["<C-l>"] = { function() vim.cmd([[wincmd l]]) end },
                },
              },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      {
        "<leader>e",
        function() Snacks.explorer() end,
        desc = "Explorer Snacks (cwd)",
      },
      {
        "<leader>E",
        function() Snacks.explorer({ cwd = LazyVim.root() }) end,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<C-g>",
        function()
          local explorers = Snacks.picker.get({ source = "explorer" })
          if #explorers == 0 then
            Snacks.explorer.reveal()
          else
            explorers[1]:focus()
          end
        end,
        desc = "Focus file",
      },
      {
        "<leader>fh",
        function() Snacks.picker.files({ hidden = true }) end,
        desc = "Find files (including hidden)",
      },
      {
        "<leader>fa",
        function() require("snacks").picker.files({ hidden = true, ignored = true }) end,
        desc = "Find all files",
      },
    },
  },
}
