# this script adds the brew paths
eval "$(/opt/homebrew/bin/brew shellenv)"

# brew zsh-completions
# follow instructions after install zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# https://starship.rs/
eval "$(starship init zsh)"

# Path to my local binaries
PATH="/Users/sg/.local/bin:$PATH"

# Zed as the default editor
export EDITOR='zed --wait'
export VISUAL='zed --wait'

# bat as default pager
export PAGER="bat"
export BAT_PAGER="less -RF"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# bat colorize help function
h() {
  "$@" -h 2>&1 | bat --language=help
}

# aliases
alias l='eza -la'
