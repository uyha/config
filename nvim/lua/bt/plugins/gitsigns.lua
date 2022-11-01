local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd({ "BufRead" }, {
    group = vim.api.nvim_create_augroup("BTGitSignsLazyLoad", {}),
    callback = function()
      vim.fn.system("git -C " .. vim.fn.expand "%:p:h" .. " status")
      if vim.v.shell_error == 0 then
        vim.api.nvim_del_augroup_by_name "BTGitSignsLazyLoad"
        vim.schedule(function() require("packer").loader "gitsigns.nvim" end)
      end
    end,
  })
end

M.config = function() require("gitsigns").setup() end

return M
