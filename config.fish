# Homebrew paths
/opt/homebrew/bin/brew shellenv | source

# My local binaries
fish_add_path -g ~/.local/bin

# Aliases funtions
function l --description "eza tree listing with optional level depth"
    if test (count $argv) -eq 0
        eza --all --git-ignore --tree --level=1 --sort=type --group-directories-first
    else
        eza --all --git-ignore --tree --level=$argv[1] --sort=type --group-directories-first $argv[2..-1]
    end
end

# bat (https://github.com/sharkdp/bat) colorful man pager
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# https://starship.rs/
starship init fish | source
