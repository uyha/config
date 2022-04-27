-- lsp
local lsp = require "lspconfig"
local on_attach = require("utils").on_attach

local servers = { "pyright", "cmake", "clangd", "rust_analyzer", "tsserver", "svelte", "html" }
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, server in ipairs(servers) do
  lsp[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- nvim-cmp
local cmp = require "cmp"
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-k>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping {
      c = function()
        if cmp.visible() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
        elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          vim.api.nvim_feedkeys(t "<Plug>(ultisnips_jump_forward)", "m", true)
        else
          fallback()
        end
      end,
      s = function(fallback)
        if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          vim.api.nvim_feedkeys(t "<Plug>(ultisnips_jump_forward)", "m", true)
        else
          fallback()
        end
      end,
    },
    ["<S-Tab>"] = cmp.mapping {
      c = function()
        if cmp.visible() then
          cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
        elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          return vim.api.nvim_feedkeys(t "<Plug>(ultisnips_jump_backward)", "m", true)
        else
          fallback()
        end
      end,
      s = function(fallback)
        if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          return vim.api.nvim_feedkeys(t "<Plug>(ultisnips_jump_backward)", "m", true)
        else
          fallback()
        end
      end,
    },
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "ultisnips" },
    { name = "buffer" },
    { name = "path" },
  },
}

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- nvim-treesitter
require("nvim-treesitter.configs").setup {
  ensure_install = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
}

-- indent-blankline.nvim
require("indent_blankline").setup {}

-- nvim-tree.lua
require("nvim-tree").setup {
  view = {
    auto_resize = false,
    relativenumber = true,
  },
  git = {
    ignore = true,
  },
}

-- feline.nvim
require("feline").setup {}

-- gitsigns.nvim
require("gitsigns").setup {}

-- nvim-lint
require("lint").linters_by_ft = {
  sh = { "shellcheck" },
}
require("lint").linters.shellcheck.args = { "-x", "--format", "json", "-" }
