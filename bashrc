# Starship prompt
eval "$(starship init bash)"

# default editor
export EDITOR=/usr/local/bin/nvim

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# aliases ####################################################################
alias vi='nvim'
alias vim='nvim'
alias l='exa -l'
alias ll='exa -la'
alias lll='exa -la --tree'
alias l1='exa --git-ignore --tree --level=1 --sort=type --reverse'
alias l2='exa --git-ignore --tree --level=2 --sort=type --reverse'

# [brew] bash-completation must be installed.
# It includes git-prompt.sh and git-completion.bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# environment variables ######################################################

# [brew] Add Homebrew's executable directory to the front of the PATH
export PATH="/usr/local/sbin:$PATH"

# Since OS Catalina the default shell is zsh, this avoid the warning:
export BASH_SILENCE_DEPRECATION_WARNING=1

# [rust] Cargo is the Rust builder and package manager
export PATH="$HOME/.cargo/bin:$PATH"

# bat color theme
export BAT_THEME="ansi"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Volumes/usb1/users/user1/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Volumes/usb1/users/user1/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Volumes/usb1/users/user1/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Volumes/usb1/users/user1/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
