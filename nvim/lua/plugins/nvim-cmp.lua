return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    local compare = require("cmp.config.compare")

    opts.sorting.comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      ---@diagnostic disable-next-line: assign-type-mismatch
      compare.recently_used,
      ---@diagnostic disable-next-line: assign-type-mismatch
      compare.locality,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    }

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-o>"] = cmp.mapping(function(fallback)
        if not cmp.complete() then fallback() end
      end, { "i", "s" }),
    })
    return opts
  end,
}
