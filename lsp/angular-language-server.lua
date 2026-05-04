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
  root_markers = { "angular.json", "nx.json", "project.json" },
}
