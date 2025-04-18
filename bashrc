# [apple silicon brew] path
export PATH="/opt/homebrew/bin:$PATH"

# [Starship] prompt
eval "$(starship init bash)"

# [apple silicon brew] nvim as default editor
export EDITOR=/opt/homebrew/bin/nvim

# aliases
alias vim='nvim'
alias l='eza --group-directories-first'
alias ll='eza -l --group-directories-first'
alias la='eza -la --group-directories-first'
alias l1='eza --git-ignore --tree --level=1 --sort=type --reverse --group-directories-first'
alias l2='eza --git-ignore --tree --level=2 --sort=type --reverse --group-directories-first'
#if using kitty terminal, allow to use kitty keymapping in ssh
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# [brew] [bash-completion@2] avoid conflicts with bash-completion:
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Since OS Catalina the default shell is zsh, this avoid the warning:
export BASH_SILENCE_DEPRECATION_WARNING=1

# [bat] color theme
export BAT_THEME="ansi"
export PATH="/opt/homebrew/sbin:$PATH"

# [rust] Cargo is the Rust builder and package manager
. "$HOME/.cargo/env"

# vim is the man pager
export MANPAGER='nvim +Man!'

# postgres
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
