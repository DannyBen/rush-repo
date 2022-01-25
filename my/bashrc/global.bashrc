### General
PS1="\n\n\h \W \$ "
export EDITOR=vim

### For RVM, exclude these binaries from the automatic bundle exec prepend
### Reference: https://github.com/rvm/rubygems-bundler
export NOEXEC_EXCLUDE="run! github_changelog_generator"

### Non-alf aliases
alias ..="cd .."

### Audio Addict
export AUDIO_ADDICT_DOWNLOAD_COUNT=3

### Disable docker Snyk suggestion after ``docker build``
export DOCKER_SCAN_SUGGEST=false
