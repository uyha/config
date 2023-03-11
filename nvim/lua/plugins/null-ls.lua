return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    local builtins = nls.builtins
    local formatting = builtins.formatting
    local diagnostics = builtins.diagnostics
    local code_actions = builtins.code_actions

    return {
      sources = {
        -- Web stuff
        formatting.prettierd.with({ extra_filetypes = { "svelte" } }),

        -- Lua
        formatting.stylua,
        diagnostics.luacheck.with({ extra_args = { "--globals", "vim" } }),

        -- Shell
        formatting.shfmt.with({ extra_args = { "-i", "2" } }),
        code_actions.shellcheck.with({}),
        diagnostics.shellcheck,

        -- C/C++
        formatting.clang_format,

        -- Python
        formatting.black,
        diagnostics.flake8,

        -- Perl
        formatting.perltidy,

        -- Rust
        formatting.rustfmt,

        -- Github Action
        diagnostics.actionlint,
      },
    }
  end,
}
