# Export $GOPATH
export GOPATH=$HOME/Projects/go

# Set $EDITOR
export EDITOR="nvim"
export VISUAL="nvim"

# Export $PATH
export PATH=$PATH:$HOME/.npm/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.fzf/bin

# Kubernetes
export KUBE_EDITOR="${EDITOR}"
export KUBECONFIG="$HOME/.kube/config"

# Use fdfind for FZF
export FZF_DEFAULT_COMMAND="fdfind -H --exclude .git --exclude __pycache__ --exclude node_modules --exclude venv --exclude *.pyc --exclude *.png --exclude .vagrant"

# Fix Ctrl+s & Ctrl+r
stty -ixon

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History
AVAILABLE_SHOPT=`shopt`
export HISTIGNORE="ll:gst:gd:vim:cd:tma:fg:ls:ps:history"
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000

# Reload history after each command (tmux panes)
export PROMPT_COMMAND="history -a; history -n"

if [[ ${AVAILABLE_SHOPT} =~ histappend ]]; then
    shopt -s histappend
fi

# Prompt
PS1="\u@\h \w \!$ "; export PS1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
if [[ ${AVAILABLE_SHOPT} =~ checkwinsize ]]; then
    shopt -s checkwinsize
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

# Ctrl-arrow-left & Ctrl-arrow-right to move through words
bind '"\e[1;5D" backward-word' 
bind '"\e[1;5C" forward-word'

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

# Setup fasd
if [ -f /usr/bin/fasd ]; then
    eval "$(fasd --init auto)"
fi

# Minio client completion
if [ -f /usr/local/bin/mc ]; then
    complete -C /usr/local/bin/mc mc
fi

# Alacritty completion
if [ -f /usr/local/bin/alacritty ] && [ -f ~/.bash_completion.d/alacritty ]; then
    source ~/.bash_completion.d/alacritty
fi
