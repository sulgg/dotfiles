# default editor
export EDITOR=/usr/local/bin/nvim

# history
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# promt ######################################################################

color_prompt=yes

# [brew] bash-completation must be installed.
# It includes git-prompt.sh and git-completion.bash in order to use
# __git_ps1() function to show current git branch when apply
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# git-prompt.sh conf vars
GIT_PS1_SHOWDIRTYSTATE='1'
GIT_PS1_SHOWSTASHSTATE='1'
GIT_PS1_SHOWUNTRACKEDFILES='1'

# color constants copied from ~/src/dotfiles/color_constants
Color_Off='\e[0m'       # Text Reset
BBlue='\e[1;34m'        # Blue
BRed='\e[1;31m'         # Red

if [ "$color_prompt" = yes ]; then
    PS1="\[$BBlue\]\w \[$BRed\]\$(__git_ps1 ' %s ')\[$Color_Off\]\$ "
fi

# aliases ####################################################################
# vi opens neovim (nvim)
alias vi='nvim'
alias vim='nvim'
# typos
alias cd..='cd ..'
alias cd...='cd ..'
alias gitl='git log --oneline --decorate --graph --all --max-count=10'
# ls is based on gnu ls command, not bsd
alias l='exa -l'
alias ll='exa -la'
alias lll='exa -la --tree'
# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# locations
alias de='cd ~/Desktop'
alias vf='cd ~/src'
alias dw='cd ~/Downloads'
alias usbd='cd /Volumes/usbd'

# environment variables ######################################################

# java
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home'
# To make sure that the correct binaries for that Java version are called, you
# also should add the following somewhere after the above statement:
export PATH=$JAVA_HOME/bin:$PATH

# [brew] man pages. export and ${var-default_value} must be passed
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH-/usr/share/man}"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman/:$MANPATH"

# [brew]
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
# [brew][python3]
# For pkg-config to find openssl you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
# For pkg-config to find readline you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
# For pkg-config to find sqlite you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"
# Since OS Catalina the default shell is zsh, this avoid the warning:
export BASH_SILENCE_DEPRECATION_WARNING=1
# Cargo is the Rust builder and package manager
export PATH="$HOME/.cargo/bin:$PATH"
