# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/vim

test -s ~/.alias && . ~/.alias || true

#mi promt
#PS1="\[\n$(ppwd)\033[36m\]\[\033[1;36m\u@\[\033[1;36m\h: \[\033[0;33m\]\w\n\[\033[1;36m\$ \[\033[0m\]"
PS1="\[\n$(ppwd)\[\033[0;31m\]\w\n\[\[\033[0;36m\]\$ \[\033[0m\]"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

#ALIASES##############################################################################

#estos aliases opensuse los trae por defecto:

#alias +='pushd .'
#alias -='popd'
#alias ..='cd ..'
#alias ...='cd ../..'
#alias beep='echo -en "\007"'
#alias cd..='cd ..'
#alias dir='ls -l'
#alias egrep='egrep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias grep='grep --color=auto'
#alias l='ls -alF'
#alias la='ls -la'
#alias ll='ls -l'
#alias ls='_ls'
#alias ls-l='ls -l'
#alias md='mkdir -p'
#alias o='less'
#alias rd='rmdir'
#alias rehash='hash -r'
#alias unmount='echo "Error: Try the command: umount" 1>&2; false'
#alias you='if test "$EUID" = 0 ; then /sbin/yast2 online_update ; else su - -c "/sbin/yast2 online_update" ; fi'

#mis aliases
alias l='ls -l'
alias ll='ls -alF'
alias ld='ls -ld'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias za='cd /home/sg/gd'
alias az='cd /home/sg/gd'
alias xs='cd /home/sg/sb'
alias sx='cd /home/sg/sb'
alias dw='cd /home/sg/downloads'
alias wd='cd /home/sg/downloads'
alias vf='cd /home/sg/src'
alias fv='cd /home/sg/src'
alias gh='cd /home/sg/src'
alias dr='cd /home/sg/Dropbox'
alias win='cd /windows/usuarios/Saul/Desktop'

alias gti='git'
alias gi='git'
alias kdo='kde-open'
alias miw='cd /home/sg/gd/miwiki && make html'
