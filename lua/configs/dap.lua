local dap = require "dap"
local dapui = require "dapui"

-- find lldb-dap, falling back to the older name
local lldb_bin = vim.fn.exepath "lldb-dap"
if lldb_bin == "" then
  lldb_bin = vim.fn.exepath "lldb-vscode"
end
if lldb_bin == "" then
  vim.notify("lldb-dap not found on $PATH", vim.log.levels.WARN)
end

dap.adapters.lldb = {
  type = "executable",
  command = lldb_bin,
  name = "lldb",
}

local cpp_config = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = function()
      local input = vim.fn.input "Args: "
      return vim.split(input, " ", { trimempty = true })
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,

    -- inherit parent env (lldb-dap doesn't by default)
    env = function()
      local vars = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(vars, string.format("%s=%s", k, v))
      end
      return vars
    end,
  },
  {
    name = "Attach to PID",
    type = "lldb",
    request = "attach",
    pid = require("dap.utils").pick_process,
    args = {},
  },
}

dap.configurations.cpp = cpp_config
dap.configurations.c = cpp_config
dap.configurations.rust = cpp_config

-- UI
dapui.setup()
require("nvim-dap-virtual-text").setup {}

-- auto-open / close UI around sessions
local function open()
  dapui.open()
end
local function close()
  dapui.close()
end
dap.listeners.before.attach.dapui_config = open
dap.listeners.before.launch.dapui_config = open
dap.listeners.before.event_terminated.dapui_config = close
dap.listeners.before.event_exited.dapui_config = close

-- breakpoint sign cosmetics
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DiagnosticInfo" })

-- keymaps
local map = vim.keymap.set
map("n", "<F5>", dap.continue, { desc = "DAP continue" })
map("n", "<F10>", dap.step_over, { desc = "DAP step over" })
map("n", "<F11>", dap.step_into, { desc = "DAP step into" })
map("n", "<F12>", dap.step_out, { desc = "DAP step out" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "DAP conditional breakpoint" })
map("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
map("n", "<leader>dl", dap.run_last, { desc = "DAP run last" })
map("n", "<leader>du", dapui.toggle, { desc = "DAP UI toggle" })
map({ "n", "v" }, "<leader>de", function()
  dapui.eval(nil, { enter = true })
end, { desc = "DAP eval expression" })
