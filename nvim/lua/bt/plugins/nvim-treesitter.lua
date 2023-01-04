local M = {}

M.setup = function()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "dockerfile",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "rust",
      "svelte",
      "typescript",
      "vim",
    },

    highlight = { enable = true, additional_vim_regex_highlighting = false },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
    },
    playground = {
      enable = true
    }
  }
end

return M
