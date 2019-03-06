#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias mdata="udisksctl mount -b /dev/sda5"
alias umdata"udisksctl unmount -b /dev/sda5"
alias cddata="cd /run/media/jurigwifi/1A61506F6F1A4896/"
