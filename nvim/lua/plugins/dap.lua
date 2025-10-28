return {
  {
    "mfussenegger/nvim-dap",

    keys = {
      { "<Right>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<Left>", function() require("dap").step_out() end, desc = "Step Out" },
      { "<Down>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<Up>", function() require("dap").step_back() end, desc = "Step Back" },
      { "<F9>", function() require("dap").run_last() end, desc = "Start/Continue" },
      { "<F10>", function() require("dap").continue() end, desc = "Start/Continue" },
    },
  },
}
