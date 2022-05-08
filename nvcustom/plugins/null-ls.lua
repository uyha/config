local null_ls = require "null-ls"
local builtins = null_ls.builtins
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics
local map = require("core.utils").map

return {
   setup = function()
      null_ls.setup {
         debug = true,
         sources = {
            formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },
            formatting.deno_fmt,

            formatting.stylua,
            diagnostics.luacheck.with { extra_args = { "--globals vim" } },

            formatting.shfmt.with {
               extra_args = {"-i", "2"},
            },
            diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
         },
         on_attach = function(client)
            if client.resolved_capabilities.document_formatting then
               map("n", "<leader>fm", function()
                  vim.lsp.buf.formatting()
               end)
            end
            map("n", "<leader>e", function()
               vim.diagnostic.open_float()
            end)
         end,
      }
   end,
}
