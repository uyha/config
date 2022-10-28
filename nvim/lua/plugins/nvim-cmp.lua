local M = {}

local cmp = require "cmp"

M.setup = function()
  cmp.setup {
    mapping = cmp.mapping.preset.insert {
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
      ["<CR>"] = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
  }
end

return M

