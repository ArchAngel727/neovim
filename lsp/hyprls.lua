return {
  cmd = { "hyprls" },
  filetypes = { "hyprlang" },
  root_markers = { ".git" },
  settings = {
    hyprls = {
      preferIgnoreFile = true,
      ignore = { "hyprlock.conf", "hypridle.conf" },
    },
  },
}
