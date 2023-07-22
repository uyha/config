return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local compare = require("cmp.config.compare")
    opts.sorting.comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.locality,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    }
    return opts
  end,
}
