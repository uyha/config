local M = {}

M.setup = function()
   require("plugins.configs.others").luasnip()
   require("luasnip.loaders.from_snipmate").load {
      paths = { "~/.config/nvcustom/snippets" },
   }
end

return M
