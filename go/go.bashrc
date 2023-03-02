# Add Go bin to path
if [[ -d "/usr/local/go/bin" ]] && [[ ":$PATH:" != *":/usr/local/go/bin:"* ]]; then
  PATH=$PATH:/usr/local/go/bin
fi
