js_install() {
  command_exist pnpm || needs pnpm
  app="$1"

  say "installing $app using pnpm"
  pnpm install -g "$app"
}
