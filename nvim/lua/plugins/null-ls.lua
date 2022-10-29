local M = {}

local null_ls = require "null-ls"
local builtins = null_ls.builtins
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics
local code_actions = builtins.code_actions

M.setup = function()
  null_ls.setup {
    sources = {
      -- Web stuff
      formatting.prettier.with { extra_filetypes = { "svelte" } },

      -- Lua
      formatting.stylua,
      diagnostics.luacheck.with { extra_args = { "--globals", "vim" } },

      -- Shell
      formatting.shfmt.with { extra_args = { "-i", "2" } },
      code_actions.shellcheck.with {},

      -- C/C++
      formatting.clang_format,

      -- Python
      formatting.black,

      -- Perl
      formatting.perltidy,

      -- Rust
      formatting.rustfmt,
    },
    on_attach = function(client)
      if client.server_capabilities.documentFormattingProvider then
        vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end)
      end
      if client.server_capabilities.codeActionProvider then
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
      end
    end,
  }
end

return M
