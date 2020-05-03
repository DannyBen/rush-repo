# This allows encrypting from stdin, using:
#
#   $ echo "secret" | gpg2 -c > out.gpg
# 
# Or, for ascii output:
#
#   $ echo "secret" | gpg2 -ac
#
export GPG_TTY=$(tty)