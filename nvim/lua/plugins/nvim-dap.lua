return {
  "mfussenegger/nvim-dap",
  dependencies = { "rcarriga/nvim-dap-ui", "williamboman/mason.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local registry = require("mason-registry")

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    -- Python
    dap.adapters.python = {
      type = "executable",
      command = registry.get_package("debugpy"):get_install_path() .. "/debugpy-adapter",
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",

        program = "${file}",
      },
    }

    -- C++
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = registry.get_package("cpptools"):get_install_path() .. "/extension/debugAdapters/bin/OpenDebugAD7",
    }
    dap.configurations.cpp = {
      {
        name = "Launch an executable",
        type = "cppdbg",
        request = "launch",
        cwd = "${workspaceFolder}",
        program = function()
          return coroutine.create(function(coro)
            local opts = {}
            pickers
              .new(opts, {
                prompt_title = "Path to executable",
                finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
                sorter = conf.generic_sorter(opts),
                attach_mappings = function(buffer_number)
                  actions.select_default:replace(function()
                    actions.close(buffer_number)
                    coroutine.resume(coro, action_state.get_selected_entry()[1])
                  end)
                  return true
                end,
              })
              :find()
          end)
        end,
      },
    }
  end,
  keys = {
    { "<F5>", function() require("dap").continue() end, desc = "DAP: start/continue" },
    { "<F10>", function() require("dap").step_over() end, desc = "DAP: step over" },
    { "<F11>", function() require("dap").step_into()() end, desc = "DAP: step into" },
    { "<F12>", function() require("dap").step_out() end, desc = "DAP: step out" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: toggle breakpoint" },
    {
      "<leader>dB",
      function()
        vim.ui.input({ prompt = "Log message: " }, function(input) require("dap").set_breakpoint(nil, nil, input) end)
      end,
      desc = "DAP: set breakpoint with a log message",
    },
    { "<leader>dr", function() require("dap").repl.open() end, desc = "DAP: open REPL" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "DAP: run last debug session" },
    { "<leader>dh", function() require("dap.ui.widgets").hover() end, mode = { "n", "v" }, desc = "DAP: hover" },
    { "<leader>dp", function() require("dap.ui.widgets").preview() end, mode = { "n", "v" }, desc = "DAP: preivew" },
    {
      "<leader>df",
      function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
      end,
      desc = "DAP: frames",
    },
    {
      "<leader>ds",
      function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
      end,
      desc = "DAP: scopes",
    },
  },
}
