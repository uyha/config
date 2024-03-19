return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    if type(opts.servers) ~= "table" then return end

    vim.tbl_extend("force", opts.servers, {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=never",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        keys = {
          { "<leader>cs", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
      },
    })
  end,
}
