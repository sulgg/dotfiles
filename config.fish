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

# https://github.com/sharkdp/bat
# man pager
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
# theme
set -gx BAT_THEME_DARK "Catppuccin Frappe"

# https://starship.rs/
starship init fish | source

# Show no welcome msg when init the terminal.
# Additionally, in macOS,  to avoid the "Last login.." msg,
# create a .hushlogin file in ~
set fish_greeting ""
