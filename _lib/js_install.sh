js_install() {
  if ! command_exist pnpm; then
    needs pnpm
    source ~/.bashrc.d/pnpm.bashrc
  fi

  app="$1"
  say "installing $app using pnpm"
  pnpm install -g "$app"
}
