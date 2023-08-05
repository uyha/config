return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local api = require("nvim-tree.api")

      require("nvim-tree").setup({
        actions = {
          open_file = {
            resize_window = false,
          },
        },
        filters = {
          dotfiles = true,
        },
        git = {
          timeout = 1000,
        },
        on_attach = function(buffer_num)
          local opts = function(options) return vim.tbl_extend("keep", { buffer = buffer_num }, options) end

          api.config.mappings.default_on_attach(buffer_num)

          vim.keymap.set("n", "zR", api.tree.expand_all, opts({ desc = "nvim-tree: Expand all" }))
          vim.keymap.set("n", "zM", api.tree.collapse_all, opts({ desc = "nvim-tree: Collapse all" }))
          vim.keymap.set("n", "zc", api.node.navigate.parent_close, opts({ desc = "nvim-tree: Close parent" }))
        end,
      })
    end,
    keys = {
      { "<leader>e", function() require("nvim-tree.api").tree.toggle() end, desc = "Toggle nvim-tree" },
      {
        "<C-p>",
        function() require("nvim-tree.api").tree.find_file({ open = true, focus = true }) end,
        desc = "Show current file in nvim-tree",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
}
