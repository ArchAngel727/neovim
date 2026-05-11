local project_root = vim.fs.root(0, { "angular.json", "nx.json", "package.json" })

local probe_paths = {
  vim.fn.stdpath "data" .. "/mason/packages/angular-language-server/node_modules",
  project_root and (project_root .. "/node_modules") or nil,
}
local probe_dir = table.concat(
  vim.tbl_filter(function(p)
    return p
  end, probe_paths),
  ","
)

return {
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    probe_dir,
    "--ngProbeLocations",
    probe_dir,
  },
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { "angular.json", "nx.json", "project.json" })
    if root then
      on_dir(root)
    end
  end,
  commands = {
    ["angular.applyCompletionCodeAction"] = function(command, ctx)
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      local offset_encoding = client and client.offset_encoding or "utf-16"

      for _, arg in ipairs(command.arguments or {}) do
        if type(arg) == "table" then
          for _, edit in ipairs(arg) do
            if edit.edit then
              vim.lsp.util.apply_workspace_edit(edit.edit, offset_encoding)
            end
          end
        end
      end
    end,
  },
}
