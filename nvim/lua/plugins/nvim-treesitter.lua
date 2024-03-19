return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "IndianBoy42/tree-sitter-just",
        ft = "just",
        config = function()
          ---@diagnostic disable-next-line: inject-field
          require("nvim-treesitter.parsers").get_parser_configs().just = {
            install_info = {
              url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
              files = { "src/parser.c", "src/scanner.c" },
              branch = "main",
            },
            maintainers = { "@IndianBoy42" },
          }
        end,
      },
    },
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "dockerfile",
          "html",
          "javascript",
          "json",
          "just",
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
