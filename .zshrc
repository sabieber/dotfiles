# ALIASES

alias ls='ls -lac'
alias f='open -a Finder ./'
alias edit='code'

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

alias lbin="goto /usr/local/bin"
alias home="goto /Users/sbi"
alias dl="goto /Users/sbi/Downloads"
alias dev="goto /Users/sbi/dev"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias goto="eval 'echo `pwd` | tr -d \\n | pbcopy'; cd"
alias back="cd `pbpaste`"
alias ..='cd ..'
alias cd..="cd .."
alias timestamp="date +%s"
alias ts="date +%s"

alias h='history 1 | grep'

alias xsh='ssh -l root'
alias osh='ssh -l root -L 9205:10.100.107.107:9200 -L 3390:10.100.107.204:3389 oxomi.com'

alias j13="export JAVA_HOME=`/usr/libexec/java_home -v 13`; java -version"
alias j9="export JAVA_HOME=`/usr/libexec/java_home -v 9`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"

alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# PATH

export LC_ALL=de_DE.UTF-8
export LANG=de_DE.UTF-8

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$JAVA_HOME/lib
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin:/usr/bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin
export PATH=$PATH:$HOME/.fastlane/bin
export PATH=$PATH:$HOME/dev/flutter/bin

# POWERLEVEL9K

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time time)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_middle'

POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

POWERLEVEL9K_DIR_HOME_BACKGROUND='237'
POWERLEVEL9K_DIR_HOME_FOREGROUND='249'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='237'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='249'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='237'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='249'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="015"
POWERLEVEL9K_STATUS_OK_BACKGROUND='black'
POWERLEVEL9K_STATUS_OK_FOREGROUND='green'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='black'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='red'
POWERLEVEL9K_TIME_BACKGROUND='242'
POWERLEVEL9K_TIME_FOREGROUND='249'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='237'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='249'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='237'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='178'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME='powerlevel10k/powerlevel10k'
source  ~/dev/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

# Configure history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zhistory

# Enable colors for promt
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# Initialize the autocompletion
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# Include hidden files
_comp_options+=(globdots)

# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

# Allow ls to switch directories (bound to ctrl+o)
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Load powerlevel
source ~/dev/powerlevel10k/powerlevel10k.zsh-theme
# Load syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
