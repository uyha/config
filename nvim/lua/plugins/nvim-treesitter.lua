return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "dockerfile",
          "devicetree",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        })
      end

      opts.textobjects = vim.tbl_deep_extend("force", opts.textobjects or {}, {
        select = {
          enable = true,
          lookahead = true,
        },
        swap = {
          enable = true,
          swap_next = { ["<leader>tl"] = "@parameter.inner" },
          swap_previous = { ["<leader>th"] = "@parameter.inner" },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]a"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[a"] = "@parameter.inner",
          },
        },
      })
    end,
  },
}
