local null_ls = require "null-ls"
local builtins = null_ls.builtins
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics

return {
  setup = function()
    null_ls.setup {
      debug = true,
      sources = {
        -- Web stuff
        formatting.prettier,

        -- Lua
        formatting.stylua,
        diagnostics.luacheck.with { extra_args = { "--globals", "vim" } },

        -- Shell
        formatting.shfmt.with { extra_args = { "-i", "2" } },

        -- C/C++
        formatting.clang_format,

        -- Python
        formatting.black,

        -- Perl
        formatting.perltidy,
      },
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.keymap.set("n", "<leader>fm", function()
            vim.lsp.buf.formatting()
          end)
        end
      end,
    }
  end,
}
