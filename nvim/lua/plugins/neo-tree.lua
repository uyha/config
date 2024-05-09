return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup({
        hint = "floating-big-letter",
        selection_chars = "ABCDEFG",
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix", "nofile" },
          },
        },
        show_prompt = false,
      })
    end,
  },
  opts = {
    filesystem = {
      follow_current_file = { enabled = false },
    },
    event_handlers = {
      {
        event = "neo_tree_window_after_open",
        handler = function(args)
          if args.position == "left" or args.position == "right" then vim.cmd("wincmd =") end
        end,
      },
      {
        event = "neo_tree_window_after_close",
        handler = function(args)
          if args.position == "left" or args.position == "right" then vim.cmd("wincmd =") end
        end,
      },
    },
    window = {
      mappings = {
        ["<cr>"] = "open_with_window_picker",
        ["<C-x>"] = "split_with_window_picker",
        ["<C-v>"] = "vsplit_with_window_picker",
        ["Y"] = "copy_relative_path",
        ["<Tab>"] = "open",
      },
    },
    commands = {
      copy_relative_path = function(state)
        local node = state.tree:get_node()
        local path = vim.fn.fnamemodify(node:get_id(), ":.")
        vim.fn.setreg("+", path)
        vim.notify(path .. " is copied to the clipboard")
      end,
    },
  },
  keys = {
    {
      "<leader>e",
      function() require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() }) end,
      desc = "Explorer NeoTree (cwd)",
      remap = true,
    },
    {
      "<Tab>",
      function()
        local path = vim.fn.expand("%:p")
        require("neo-tree.command").execute({ reveal_file = path })
      end,
      desc = "Locate current file in NeoTree",
    },
  },
}
