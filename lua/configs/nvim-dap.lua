return {
  "mfussenegger/nvim-dap",
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "DAP continue",
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      desc = "DAP step over",
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
      desc = "DAP step into",
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
      desc = "DAP step out",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "DAP breakpoint",
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      desc = "DAP conditional breakpoint",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "DAP REPL",
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "DAP run last",
    },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "DAP UI toggle",
    },
  },
  dependencies = {
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    require "configs.dap"
  end,
}
