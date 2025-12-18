---@param absolute boolean Specification for paths being copied as absolute or relative
local function yank_files(absolute)
  local picker = Snacks.picker.get({ source = "explorer" })[1]
  local files = {} ---@type string[]
  if vim.fn.mode():find("^[vV]") then picker.list:select() end
  for _, item in ipairs(picker:selected({ fallback = true })) do
    local path = Snacks.picker.util.path(item)
    assert(path ~= nil)
    if absolute then
      table.insert(files, path)
    else
      table.insert(files, vim.fs.relpath(picker:cwd(), path))
    end
  end
  picker.list:set_selected() -- clear selection
  local value = table.concat(files, "\n")
  vim.fn.setreg(vim.v.register or "+", value, "c")
  Snacks.notify.info("Yanked " .. #files .. (#files == 1 and " file" or " files"))
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "toggle_focus", mode = { "i" } },
            },
          },
          list = {
            keys = {
              ["H"] = "toggle_hidden",
              ["I"] = "toggle_ignored",
            },
          },
        },
        sources = {
          explorer = {
            matcher = { fuzzy = true },
            win = {
              list = {
                keys = {
                  ["<C-g>"] = function()
                    local explorer = Snacks.picker.get({ source = "explorer" })[1]
                    explorer:action("confirm")
                    explorer:close()
                  end,
                  ["y"] = {
                    function() yank_files(false) end,
                    mode = { "n", "v" },
                  },
                  ["Y"] = {
                    function() yank_files(true) end,
                    mode = { "n", "v" },
                  },
                  ["<C-l>"] = {
                    function() vim.cmd([[wincmd l]]) end,
                    mode = { "n" },
                  },
                  ["z"] = "explorer_close_all",
                },
              },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      {
        "<leader>e",
        function() Snacks.explorer() end,
        desc = "Explorer Snacks (cwd)",
      },
      {
        "<leader>E",
        function() Snacks.explorer({ cwd = LazyVim.root() }) end,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<C-g>",
        function()
          local explorers = Snacks.picker.get({ source = "explorer" })
          if #explorers == 0 then
            Snacks.explorer.reveal()
          else
            explorers[1]:focus()
          end
        end,
        desc = "Focus file",
      },
      {
        "<leader>fh",
        function() Snacks.picker.files({ hidden = true }) end,
        desc = "Find files (including hidden)",
      },
      {
        "<leader>fa",
        function() require("snacks").picker.files({ hidden = true, ignored = true }) end,
        desc = "Find all files",
      },
    },
  },
}
