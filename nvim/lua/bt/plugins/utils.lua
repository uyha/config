local M = {}

M.is_normal_file = function()
  local file = vim.fn.expand "%"
  return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
end

M.ensure_packer = function()
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

    return true
  end
  return false
end

M.ensure_lazynvim = function()
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
  if vim.fn.empty(vim.fn.glob(lazypath)) > 0 then
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    }
  end
  vim.opt.runtimepath:prepend(lazypath)
end

M.lazy_load = function(load_config)
  local augroup_name = "BTLazyLoad" .. load_config.name
  vim.api.nvim_create_autocmd(load_config.events, {
    group = vim.api.nvim_create_augroup(augroup_name, {}),
    callback = function()
      if load_config.condition() then
        vim.api.nvim_del_augroup_by_name(augroup_name)
        vim.defer_fn(function() require("lazy").load { plugins = { load_config.name } } end, 0)
      end
    end,
  })
end

M.on_file_open = function(name)
  M.lazy_load {
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    name = name,
    condition = M.is_normal_file,
  }
end

return M
