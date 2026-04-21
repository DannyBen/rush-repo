# Add Go-installed user tools to path
if [[ -d "$HOME/go/bin" ]] && [[ ":$PATH:" != *":$HOME/go/bin:"* ]]; then
  PATH=$PATH:$HOME/go/bin
fi
