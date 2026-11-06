return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          settings = {
            css = {
              lint = {
                -- Outlook-only properties used in email templates
                validProperties = { "mso-table-lspace", "mso-table-rspace", "mso-hide" },
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "css" },
    },
  },
}
