# [apple silicon brew] path
export PATH="/opt/homebrew/bin:$PATH"

# [Starship] prompt
eval "$(starship init bash)"

# [apple silicon brew] nvim as default editor
export EDITOR=/opt/homebrew/bin/nvim

# aliases
alias vim='nvim'
alias ll='exa'
alias l='exa -l'
alias lll='exa -la'
alias l1='exa --git-ignore --tree --level=1 --sort=type --reverse'
alias l2='exa --git-ignore --tree --level=2 --sort=type --reverse'
#if using kitty terminal, allow to use kitty keymapping in ssh
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# [brew] [bash-completion@2] avoid conflicts with bash-completion:
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# Since OS Catalina the default shell is zsh, this avoid the warning:
export BASH_SILENCE_DEPRECATION_WARNING=1

# [bat] color theme
export BAT_THEME="ansi"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/raiz/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/raiz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/raiz/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/raiz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PATH="/opt/homebrew/sbin:$PATH"

# [rust] Cargo is the Rust builder and package manager
. "$HOME/.cargo/env"
