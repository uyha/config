local M = {}

M.is_normal_file = function()
  local name = vim.fn.expand "%"
  return name ~= "NvimTree_1" and name ~= ""
end

return M
