/opt/homebrew/bin/brew shellenv | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> fish related
fish_vi_key_bindings
bind -M default \cp up-or-search
bind -M default \cn down-or-search
bind -M insert \cp up-or-search
bind -M insert \cn down-or-search
bind -M insert \ce accept-autosuggestion
set -U fish_greeting ""
# <<< fish related

# PATH additions
fish_add_path $HOME/.luarocks/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.juliaup/bin
fish_add_path /opt/homebrew/opt/postgresql@15/bin
fish_add_path /opt/homebrew/opt/llvm@17/bin
fish_add_path $HOME/Library/pnpm
fish_add_path $HOME/.bun/bin
fish_add_path /Applications/Racket\ v9.1.0.4/bin
fish_add_path $PATH /Applications/Obsidian.app/Contents/MacOS
fish_add_path $HOME/.zsh/completions # deno completions (if still needed)

# Flyway
fish_add_path $HOME/flyway-11.8.1

# Environment variables
set -gx ZSH $HOME/.oh-my-zsh # not needed if dropping oh-my-zsh
set -gx PNPM_HOME $HOME/Library/pnpm
set -gx BUN_INSTALL $HOME/.bun
set -gx CFLAGS -I/opt/homebrew/include
set -gx LDFLAGS -L/opt/homebrew/lib
# set -gx FZF_DEFAULT_OPTS "--preview 'bat --color=always {}' --preview-window=right:55%"
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml

# opam
source $HOME/.opam/opam-init/init.fish 2>/dev/null; or true

# conda
# Run: conda init fish  (let conda manage this itself)

# Google Cloud SDK
if test -f $HOME/google-cloud-sdk/path.fish.inc
    source $HOME/google-cloud-sdk/path.fish.inc
end

# zoxide (skip in Claude Code)
if test "$CLAUDECODE" != 1
    zoxide init --cmd cd fish | source
end

# direnv
direnv hook fish | source

# dune
source $HOME/.local/share/dune/env/env.fish

# fzf key bindings
fzf --fish | source

# Deno
source $HOME/.deno/env.fish 2>/dev/null; or true

# bun completions
# bun doesn't have native fish completions; copy manually if needed

# Aliases
alias vim nvim
alias cdp 'cd ~/Dropbox/portavault'
alias cdv 'cd ~/.config/nvim; nvim'
alias cdr 'cd ~/Documents/playground'
alias cdo 'cd ~/Desktop/Hongyu/Oyster'
alias ':q' exit
alias gg lazygit
alias gi 'EDITOR=nvim gh-issue-sync'
alias cnc claude-new-chat
alias pip3 'python3 -m pip'
alias j 'just --global-justfile'

starship init fish | source
