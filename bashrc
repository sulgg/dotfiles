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

# Todo lo relacionado a prompt lo maneja Starship
eval "$(starship init bash)"

# [brew] bash-completation must be installed.
# It includes git-prompt.sh and git-completion.bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# aliases ####################################################################

alias vi='nvim'
alias vim='nvim'

alias l='exa -l'
alias ll='exa -la'
alias lll='exa -la --tree'
alias l1='exa --git-ignore --tree --level=1 --sort=type --reverse'
alias l2='exa --git-ignore --tree --level=2 --sort=type --reverse'

# environment variables ######################################################

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
