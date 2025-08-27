# pure neew this:
ZSH_THEME=""

# Path to my local binaries
PATH="/Users/raiz/.local/bin:$PATH"

# Path to homebrew
PATH="/opt/homebrew/bin:$PATH"

# Path to vscode binaries
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

HIST_STAMPS="%b-%d %H:%M"

# zsh shell to use Zed as the Git editor only when inside the Zed terminal
if [[ "$TERM_PROGRAM" == "zed" ]]; then
  export EDITOR="zed --wait"
  export VISUAL="zed --wait"
  export GIT_EDITOR="zed --wait"
fi

# bat colorize help
# Define a function to wrap any command with -h
h() {
  "$@" -h 2>&1 | bat --language=help
}

plugins=(eza git conda)

# https://github.com/sharkdp/bat#adding-new-themes
export BAT_THEME="OneHalfLight"

source $ZSH/oh-my-zsh.sh

# https://github.com/sindresorhus/pure
autoload -Uz promptinit
promptinit
zstyle :prompt:pure:virtualenv color green
prompt pure

alias vim='nvim'
alias alirg='alias | rg'
