# Increase UDP receive buffer for the daemon
# ref: https://github.com/lucas-clemente/quic-go/wiki/UDP-Receive-Buffer-Size
sudo sysctl -w net.core.rmem_max=2500000 > /dev/null
