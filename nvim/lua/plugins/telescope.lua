return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-tree/nvim-tree.lua" },
  keys = {
    {
      "<leader>fd",
      function()
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        local function open_nvim_tree(prompt_bufnr, _)
          actions.select_default:replace(function()
            local api = require("nvim-tree.api")

            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            api.tree.open()
            api.tree.find_file(selection.cwd .. "/" .. selection.value)
          end)
          return true
        end

        require("telescope.builtin").find_files({
          find_command = { "fd", "--type", "directory", "--hidden", "--exclude", ".git", "--exclude", ".idea" },
          attach_mappings = open_nvim_tree,
        })
      end,
      desc = "Fuzzy find a directory and open it in nvim-tree",
    },
  },
}
