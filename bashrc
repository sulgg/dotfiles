# default editor
EDITOR=/usr/local/bin/nvim

# history
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# [brew] colors for gnu ls command
# .dircolors must be a soft link to ~/src/dotfiles/dircolors
# gdircolors is the "brew way" to call the gnu dircolors command
eval `gdircolors ~/.dircolors`

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
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -al'
# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# locations
alias de='cd ~/Desktop'
alias vf='cd ~/src'

# environment variables ######################################################

# java
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home'
# To make sure that the correct binaries for that Java version are called, you
# also should add the following somewhere after the above statement:
export PATH=$JAVA_HOME/bin:$PATH

# borrar el siguiente parrafo apenas vea que es innecesario
# By default non-brewed cpan modules are installed to the Cellar. If you wish
# for your modules to persist across updates we recommend using `local::lib`.
# You can set that up like this:
  # PERL_MM_OPT="INSTALL_BASE=$HOME/perl5" cpan local::lib
#y luego agregar esto:
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# [brew] man pages. export and ${var-default_value} must be passed
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH-/usr/share/man}"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman/:$MANPATH"
# [brew]
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

