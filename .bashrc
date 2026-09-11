#  ========================  #
#  My .bashrc configuration  #
#  ========================  #

# Append to the history file, instead of overwritting it.
shopt -s histappend

# History options
HISTSIZE=100
HISTFILESIZE=10000
HISTCONTROL=ignoreboth

# Update lines and columns after each command.
shopt -s checkwinsize

# Weapon of choice
export EDITOR='nvim'

# Color codes for shell prompt
COLOR_BASE="\[\e[96m\]"
COLOR_USER="\[\e[91m\]"
COLOR_DIR="\[\e[92m\]"
COLOR_RESET="\[\e[0m\]"

# Shell prompt
export PS1="${COLOR_BASE}[${COLOR_RESET} ${COLOR_USER} \u${COLOR_RESET} ${COLOR_BASE}]${COLOR_RESET} ${COLOR_BASE}(${COLOR_RESET} ${COLOR_DIR} \w${COLOR_RESET} ${COLOR_BASE})${COLOR_RESET} ${COLOR_BASE}>>${COLOR_RESET} "

# Sanity check
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ls="ls --color=auto"
alias ll="ls -lah"
alias la="ls -A"
alias lcf="ls -CF"

alias df="df -h"
alias free="free -m"

alias c="clear"
alias h="history"
alias myip="curl ifconfig.me && echo"

# Custom functions

# Makes a directory and jumps into it.
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# General purpose extraction tool.
extract() {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Shortcuts for applications
alias ff="fastfetch"

# FastFetch
ff