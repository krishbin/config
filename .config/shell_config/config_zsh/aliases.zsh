alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias reset='cd ~;source ~/.zshrc;clear'
alias tmun='tmux new-session -t'
alias glog='git log --all --decorate --graph'
alias glogo='git log --all --decorate --all --oneline'
alias cglog='cg log --all --decorate --graph'
alias cglogo='cg log --all --decorate --all --oneline'
alias grep='grep --color=auto'
alias ls=exa
alias ll='exa -l'
alias l='/bin/ls'
alias cat=bat
alias fzfp='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'

#################
#  git aliases  #
#################
alias ga='g a'
alias gaa='g aa'
alias gap='g ap'
alias gb='g b'
alias gcm='g commit'
alias gcob='g cob'
alias gco='g co'
alias gl='g l'
alias gll='g ll'
alias grl='g rl'
alias grll='g rll'
alias grh='g rh'
alias grb='g rb'
alias gm='g m'
alias gp='g p'
alias gs='g s'
alias gd='g d'
