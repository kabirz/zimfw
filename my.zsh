# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g 3.='../../..'
alias -g 4.='../../../..'
alias -g 5.='../../../../..'
alias -- -='cd -'
for index in {1..9}; do
  alias "$index"="cd +${index}"
done
unset index

alias md='mkdir -p'
alias rd=rmdir

# List directory contents
alias -g P="2>&1| pygmentize -l pytb"

#read documents
alias -s pdf=acroread
alias -s ps=gv
alias -s dvi=xdvi
alias -s chm=xchm
alias -s djvu=djview

#list whats inside packed file
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"

# tmux
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
function ipa() {
    if [[ "$(uname)" == "Darwin" ]]; then
        ifconfig | grep inet -w | grep -v 127.0.0.1 | awk '{print $2}'
    elif [[ "$(uname)" == "Linux" ]]; then
        ip a | grep inet -w | awk '{print $2}' | awk -F/ '{print $1}' | grep -v 127.0.0.1
    fi

}

function ipas() {
    if [[ "$(uname)" == "Darwin" ]]; then
        ifconfig | grep inet -w | awk '{print $2}'
    elif [[ "$(uname)" == "Linux" ]]; then
        ip a | grep inet -w | awk '{print $2}' | awk -F/ '{print $1}'
    fi
}


if (( ${+commands[exa]} )); then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'ls'
    alias ls='exa --color auto --icons -s type'
    alias ll='exa -l --color always --icons -s type'
		alias l='exa -lFh'
    alias la='exa -laFh'
else
    alias la='ls -lAFh'
fi
if (( ${+commands[bat]} )); then
    alias cat='bat -pp --theme Dracula'
fi
if (( ${+commands[starship]} )); then
  eval "$(starship init zsh)"
else
    source $(dirname ${(%):-%N})/steeef.zsh-theme
fi
if (( ${+commands[zoxide]} )); then
  eval "$(zoxide init zsh)"
fi

if (( ${+commands[gitui]} )); then
    alias g=gitui
fi

if (( ${+commands[joshuto]} )); then
    alias ra=joshuto
    alias jo=joshuto
elif (( ${+commands[ranger]} )); then
    alias ra=ranger
fi

if (( ${+commands[neofetch]} )); then
    alias s=neofetch
fi

if (( ${+commands[lazygit]} )); then
    alias lg=lazygit
fi

# for fzf
if (( ${+commands[fzf]} )); then
    eval "$(fzf --zsh)"
fi

if (( ${+commands[nvim]} )); then
    alias vi=nvim
    alias vim=nvim
    export EDITOR=nvim
elif (( ${+commands[vim]} )); then
    alias vi=vim
    export EDITOR=vim
else
    export EDITOR=vi
fi

[ ! -e ~/.dotfiles/zshrc ] || source ~/.dotfiles/zshrc

#mirros for rust
export RUSTUP_DIST_SERVER=http://rsproxy.cn
export RUSTUP_UPDATE_ROOT=http://rsporxy.cn/rustup
# enable true color
export COLORTERM=truecolor
export TERM=screen-256color

autoload -U compinit
compinit
setopt clobber
# proxy for golang
# export GOPROXY=https://mirrors.aliyun.com/goproxy
# replace by command: go env -w GOPROXY=https://goproxy.cn
