return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    if type(opts.sources) ~= "table" then return end

    local nls = require("null-ls")
    local builtins = nls.builtins
    local formatting = builtins.formatting
    local diagnostics = builtins.diagnostics
    local code_actions = builtins.code_actions

    vim.list_extend(opts.sources, {
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

      -- Perl
      formatting.perltidy,

      -- Github Action
      diagnostics.actionlint,
    })
  end,
}
