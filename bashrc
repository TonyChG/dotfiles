# Export $GOPATH
export GOPATH=$HOME/Projects/go

# Set $EDITOR
export EDITOR="nvim"
export VISUAL="nvim"
export TERM="xterm-256color"

# Export $PATH
export PATH=$PATH:$HOME/.npm/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.ruby/bin
export KUBE_EDITOR="${EDITOR}"
export KUBECONFIG="$HOME/.kube/config"

export NNN_OPENER=mimeopen
export NNN_FALLBACK_OPENER=mimeopen
export NNN_DE_FILE_MANAGER=polo-gtk

export NNN_COPIER="$HOME/.config/nnn/copier.sh"

# Fix Ctrl+s & Ctrl+r
stty -ixon

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

AVAILABLE_SHOPT=`shopt`
# History
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
__vte_prompt_command() { true; }

if [[ ${AVAILABLE_SHOPT} =~ histappend ]]; then
    shopt -s histappend
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Simple Prompt
PS1='\W \$ '
#PS1="\[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[36m\]\W\[\e[m\]\[\e[36m\] \[\e[m\]\[\e[31m\]\\$\[\e[m\] "

# Init fasd
eval "$(fasd --init auto)"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
if [[ ${AVAILABLE_SHOPT} =~ checkwinsize ]]; then
    shopt -s checkwinsize
fi

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# if [[ ${AVAILABLE_SHOPT} =~ globstar ]]; then
#     shopt -s globstar
# fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors \
        && eval "$(dircolors -b ~/.dircolors)" \
        || eval "$(dircolors -b)"

    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

bind '"\e[1;5D" backward-word' 
bind '"\e[1;5C" forward-word'

# Snippet to create new tmux session
function tns {
  tmux new-session -d -s $1 && [[ -n "$TMUX" ]] \
    && tmux switch-client -t $1 \
    || tmux attach
}

function exec-kube {
    virsh list  --name | egrep 'node' | xargs -I% ssh core@%.local "$1"
}

function fd-vim {
    vim $(fd "$1")
}


# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

complete -C /usr/local/bin/mc mc

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.fubectl.source ] && source ~/.fubectl.source