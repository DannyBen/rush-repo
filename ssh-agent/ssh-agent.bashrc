### Remember ssh key passphrase

# Without keychain:
# eval $(ssh-agent) > /dev/null

# With keychain:
eval $(keychain --eval --quiet)
