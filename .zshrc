export GOPATH=$HOME/dev/projects/go
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin:$HOME/dev/projects/bash/dotfiles/bin
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig
export CGO_LDFLAGS_ALLOW="-s|-w"
export CGO_CFLAGS_ALLOW="-Xpreprocessor"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BASH_SILENCE_DEPRECATION_WARNING=1
if [ -f ~/.bash_aliases ]; then
 . ~/.bash_aliases
fi
autoload -Uz compinit && compinit
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000                  # big big history
export HISTFILESIZE=1000000              # big big history
export SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY                     #Share history across terminals
setopt APPEND_HISTORY                    #Append history to the history file (no overwriting)
setopt INC_APPEND_HISTORY                #Immediately append to the history file, not just when a term is killed
setopt HIST_EXPIRE_DUPS_FIRST            #delete duplicates first when HISTFILE size exceeds HISTSIZE
