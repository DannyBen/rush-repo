# Add Go environment variables

# export GOROOT=$(go env GOROOT)
# [[ ":$PATH:" != *":${GOROOT}/bin:"* ]] && PATH="${GOROOT}/bin:${PATH}"

export GOPATH=$HOME/go
[[ ":$PATH:" != *":${GOPATH}/bin:"* ]] && PATH="${GOPATH}/bin:${PATH}"

