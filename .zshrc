export PATH=$PATH:$HOME/bin
export PATH="$RBENV_ROOT/bin:$PATH"
export DOTPATH=$HOME/dotfiles
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export TERM=xterm-256color
eval "$(rbenv init -)"

setopt prompt_subst
export RBENV_ROOT="$HOME/.rbenv"
# 重複を記録しない
setopt hist_ignore_dups
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 参考：http://tegetegekibaru.blogspot.jp/2012/08/zsh_2.html
PROMPT='
%F{cyan}[%m@%n]%f %d `prompt-git-current-branch`
%(!.# .$ )'

autoload -U compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

function prompt-git-current-branch {
        local name st color
 
        name=`git symbolic-ref HEAD 2> /dev/null`
        if [[ -z $name ]]
        then
                return
        fi
        name=`basename $name`
 
        st=`git status`
        if [[ -n `echo $st | grep "^nothing to"` ]]
        then
                color="red"
        else
                color="green"
        fi
 
        echo "%F{$color}[$name]%f"
}

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# alias # {{{

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias cdd='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias ,='cd ~'
alias v='vim'
alias nv='nvim'
alias e='exit'
alias guu='git add . && git commit -m "update" && git push'
alias vlc='open /Applications/VLC.app -n'
alias yd='youtube-dl'


# }}}

