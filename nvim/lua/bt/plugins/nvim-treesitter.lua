local M = {}

M.setup = function()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {"c", "cpp", "cmake", "lua", "rust", "regex", "bash", "help", "markdown", "markdown_inline"},
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
  }
end

return M
