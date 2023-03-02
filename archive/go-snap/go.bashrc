# Add Go environment variables

# GOPATH
export GOPATH=$HOME/go
[[ ":$PATH:" != *":${GOPATH}/bin:"* ]] && PATH="${GOPATH}/bin:${PATH}"

# GOBIN
export GOBIN=$GOPATH/bin

# GOROOT: NO NEED?
# export GOROOT=$(go env GOROOT)
# [[ ":$PATH:" != *":${GOROOT}/bin:"* ]] && PATH="${GOROOT}/bin:${PATH}"