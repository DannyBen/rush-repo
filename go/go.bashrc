# Add Go environment variables
export GOROOT=$(go env GOROOT)
export GOPATH=$HOME/go

[[ ":$PATH:" != *":${GOROOT}/bin:"* ]] && PATH="${GOROOT}/bin:${PATH}"
[[ ":$PATH:" != *":${GOPATH}/bin:"* ]] && PATH="${GOPATH}/bin:${PATH}"

