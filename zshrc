# Path to homebrew
PATH="/opt/homebrew/bin:$PATH"

# Path to vscode binaries
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

HIST_STAMPS="%b-%d %H:%M"

plugins=(starship eza git)

source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias alirg='alias | rg'
