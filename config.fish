# Homebrew path
/opt/homebrew/bin/brew shellenv | source

# Add local binaries to PATH
fish_add_path -g ~/.local/bin

# Aliases
alias l 'eza -la'

# man pager with bat colors
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Initialize Starship prompt
starship init fish | source
