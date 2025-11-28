js_uninstall() {
  command_exist pnpm || needs pnpm
  app="$1"

  say "uninstalling $app using pnpm"
  pnpm remove -g "$app"
}
