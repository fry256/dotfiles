export GOPATH=$HOME/dev/projects/go
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig
export CGO_LDFLAGS_ALLOW="-s|-w"
export CGO_CFLAGS_ALLOW="-Xpreprocessor"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BASH_SILENCE_DEPRECATION_WARNING=1
if [ -f ~/.bash_aliases ]; then
 . ~/.bash_aliases
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=1000000                  # big big history
export HISTFILESIZE=1000000              # big big history
shopt -s histappend               # append to history, don't overwrite it
