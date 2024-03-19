return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    if type(opts.servers) ~= "table" then return end

    local clangd = opts.servers.clangd or {}
    clangd.cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=never",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    }

    if type(clangd.keys) == "table" then
      vim.list_extend(clangd.keys, {
        { "<leader>cs", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
      })
    end

    opts.servers.clangd = clangd
  end,
}
