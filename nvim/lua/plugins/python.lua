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
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "black" },
    },
  },
}
