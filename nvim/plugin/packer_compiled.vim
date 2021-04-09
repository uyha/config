" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/uy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/uy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/uy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/uy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/uy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  UltiSnips = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/UltiSnips"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/uy/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/rainbow"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-ps1"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/vim-ps1"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/home/uy/.local/share/nvim/site/pack/packer/start/vim-toml"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
