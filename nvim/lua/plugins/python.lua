return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    keys = {
      { "<leader>vc", "<cmd>:VenvSelectCached<cr>", desc = "Select the previous venv for this project" },
    },
    opts = function(_, opts)
      if type(opts.settings.search) == "nil" then opts.settings.search = {} end
      if type(opts.settings.search) ~= "table" then return end

      opts.settings.search.dotvevn = {
        command = "fd '.venv/bin/python$' .. --full-path --no-ignore --hidden --absolute-path",
      }
      opts.settings.search.uv = {
        command = "fd 'bin/python$' "
          .. vim.fn.expand("~")
          .. "/.cache/uv "
          .. "--full-path --absolute-path "
          .. "--no-ignore --hidden "
          .. "--type=executable --type=symlink ",
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) ~= "table" then return end

      local nls = require("null-ls")
      local builtins = nls.builtins
      local formatting = builtins.formatting

      vim.list_extend(opts.sources, {
        formatting.black,
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) ~= "table" then return end

      vim.list_extend(opts.ensure_installed, {
        "black",
      })
    end,
  },
}
