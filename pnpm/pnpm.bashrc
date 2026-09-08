export PNPM_HOME="$HOME/.pnpm"
[[ ":$PATH:" == *":$PNPM_HOME/bin:"* ]] || export PATH="$PATH:$PNPM_HOME/bin"
