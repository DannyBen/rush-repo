export PNPM_HOME="$HOME/.pnpm"
[[ ":$PATH:" == *":$PNPM_HOME:"* ]] || export PATH="$PATH:$PNPM_HOME"
