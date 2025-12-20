# Path to my local binaries
PATH="/Users/sg/.local/bin:$PATH"

HIST_STAMPS="%b-%d %H:%M"

# Zed as the default editor
export EDITOR='zed --wait'
export VISUAL='zed --wait'

# bat colorize help function
h() {
  "$@" -h 2>&1 | bat --language=help
}

# https://github.com/sindresorhus/pure
# Pure: Pretty, minimal and fast ZSH prompt
autoload -U promptinit; promptinit
zstyle :prompt:pure:virtualenv color green
prompt pure

# aliases
alias alirg='alias | rg'
alias l='eza -la'

# this script check for the brew paths
eval "$(/opt/homebrew/bin/brew shellenv)"
