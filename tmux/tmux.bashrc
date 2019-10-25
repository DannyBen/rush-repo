# Passthrough the SSH agent to tmux panels
if tmux info &> /dev/null; then
  eval $(tmux show-env -s |grep '^SSH_')
fi
