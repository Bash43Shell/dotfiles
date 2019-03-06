export ZSH="/home/jurigwifi/.oh-my-zsh"

export LANG=en_US.UTF-8
# export TERM="xterm-256color" 

ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_MODE="awesome-fontconfig"
# POWERLEVEL9K_MODE='awesome-patched'

POWERLEVEL9K_DISABLE_PROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="» "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_arch_icon dir vcs)
# POWERLEVEL9K_CUSTOM_ARCH_ICON="echo "
# POWERLEVEL9K_CUSTOM_ARCH_ICON_BACKGROUND=069
# POWERLEVEL9K_CUSTOM_ARCH_ICON_FOREGROUND=015

plugins=(git)

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

alias ls='ls --format=single-column -g --group-directories-first --indicator-style=slash --color=never'
alias music='ncmpcpp'
alias ci3="vim ~/.config/i3/config"
alias czsh="vim ~/.zshrc"
alias cpolybar="vim ~/.config/polybar/config"
alias cvim="vim ~/.vimrc"

alias mdata="udisksctl mount -b /dev/sda5"
alias umdata"udisksctl unmount -b /dev/sda5"
alias cddata="cd /run/media/jurigwifi/Storage/"
