return {
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      search = {
        kos = {
          command = "fd --full-path 'x86_64.*python3$' /opt/kos",
        },
        uv = {
          command = "uv python find --script '$CURRENT_FILE'",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ninja", "rst" } },
  },
  {

    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ty = {},
        ruff = {},
        ruff_lsp = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "ruff" } },
  },
}
