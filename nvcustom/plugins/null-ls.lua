local null_ls = require "null-ls"
local builtins = null_ls.builtins
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics
local map = nvchad.map

return {
   setup = function()
      null_ls.setup {
         debug = true,
         sources = {
            -- Web stuff
            formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },
            formatting.deno_fmt,

            -- Lua
            formatting.stylua,
            diagnostics.luacheck.with { extra_args = { "--globals", "vim" } },

            -- Shell
            formatting.shfmt.with { extra_args = { "-i", "2" } },
            diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

            -- C/C++
            formatting.clang_format,

            -- Python
            formatting.black,
         },
         on_attach = function(client)
            if client.resolved_capabilities.document_formatting then
               map("n", "<leader>fm", function()
                  vim.lsp.buf.formatting()
               end)
            end
         end,
      }
   end,
}
