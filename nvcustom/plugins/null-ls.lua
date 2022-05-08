local null_ls = require "null-ls"
local builtins = null_ls.builtins
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics

return {
   setup = function()
      null_ls.setup {
         debug = true,
         sources = {
            formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },
            formatting.deno_fmt,

            formatting.stylua,
            diagnostics.luacheck.with { extra_args = { "--global vim" } },

            formatting.shfmt,
            diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
         },
      }
   end,
}
