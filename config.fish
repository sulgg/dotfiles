# Homebrew path
/opt/homebrew/bin/brew shellenv | source

# Add local binaries to PATH
fish_add_path -g ~/.local/bin

# Aliases
alias l 'eza -la'

# Editor configuration
set -gx EDITOR 'zed --wait'
set -gx VISUAL 'zed --wait'

# Pager configuration
set -gx PAGER bat
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Initialize Starship prompt
starship init fish | source
