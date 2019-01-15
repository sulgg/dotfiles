# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/local/bin/nvim

test -s ~/.alias && . ~/.alias || true

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

#turn on Bash Smart Completion on OSX
#bash-completation must be installed first through brew:
#brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# make bash autocomplete with up arrow
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

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

#location of git prompt and completion scripts for OSX 10.11 brew git
#this helps PS1 var to display locatin of HEAD
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE='1'
GIT_PS1_SHOWSTASHSTATE='1'
GIT_PS1_SHOWUNTRACKEDFILES='1'
Color_Off='\e[0m'       # Text Reset
BBlue='\e[1;34m'        # Blue
BRed='\e[1;31m'         # Red
if [ "$color_prompt" = yes ]; then
    #Usin __git_ps1() function to show current git branch when apply
    PS1="\[$BBlue\]\w \[$BRed\]\$(__git_ps1 ' %s ')\[$Color_Off\]\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

#################
###MIS ALIASES###
#################

#colors for gnu ls command
#.dir_colors directory must be a soft link to ~/src/dotfiles/dircolors
#gdircolors is the "brew way" to call the gnu dircolors command
eval `gdircolors ~/.dircolors`

#vi opens neovim (nvim)
alias vi='nvim'
alias vim='nvim'

#cd typos resolved
alias cd..='cd ..'
alias cd...='cd ..'

# enable color support of ls and also add handy aliases
#ls is based on gnu ls command not bsd
alias ls='ls --color=auto'

alias l='ls -l'
alias ll='ls -al'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias de='cd ~/Desktop'
alias vf='cd ~/src'

alias gitl='git log --oneline --decorate --graph --all --max-count=10'
alias miw='cd /home/sg/gd/miwiki && make html'

# here's a hacky way to use GNU manpages for programs that are GNU ones, and
# fallback to OSX manpages otherwise
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'

###################
###MIS VARIABLES###
###################

#path for sbin - brew asks for it
export PATH="/usr/local/sbin:$PATH"

#path for gnu coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

#path to java jdk1.8.0_121.jdk
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home'
# To make sure that the correct binaries for that Java version are called, you
# also should add the following somewhere after the above statement:
export PATH=$JAVA_HOME/bin:$PATH

