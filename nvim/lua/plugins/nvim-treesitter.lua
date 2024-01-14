return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "mrjones2014/nvim-ts-rainbow" },
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
    opts = {
      ensure_installed = {
        "bash",
        "cmake",
        "css",
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
        "svelte",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      rainbow = {
        enable = true,
      },
    },
  },
}
