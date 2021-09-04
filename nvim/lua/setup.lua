-- lsp
local lsp = require "lspconfig"
local on_attach = require("utils").on_attach

local servers = { "pyright", "cmake", "clangd", "rust_analyzer", "tsserver" }
for _, server in ipairs(servers) do
  lsp[server].setup {
    on_attach = on_attach,
  }
end

-- nvim-compe
require("compe").setup {
  source = {
    path = true,
    buffer = true,
    calc = true,
    spell = true,
    tags = true,
    nvim_lsp = true,
    nvim_lua = true,
    ultisnips = true,
  },
}

-- nvim-treesitter
require("nvim-treesitter.configs").setup {
  ensure_install = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
}