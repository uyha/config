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
    end,
  },
}
