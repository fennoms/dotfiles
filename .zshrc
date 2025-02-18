# alias to index into dotfiles for the git repository
alias mon="$HOME/.config/i3/scripts/monitor.sh" # 3 monitor setup at home

# starship prompt
eval "$(starship init zsh)"

# autocomplete
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HIST_IGNORE_DUPS=true
HIST_IGNORE_SPACE=true
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


. "$HOME/.local/bin/env"

[ -f "/home/fennom/.ghcup/env" ] && . "/home/fennom/.ghcup/env" # ghcup-env
alias vim="nvim"

# Compiler Construction Course
export PATH=$PATH:~/Documents/civic_toolchain/bin:~/.dotnet/tools
source ~/Documents/civic_toolchain/bin/civ_complete.bash

alias pandock='docker run --rm -v "$(pwd):/data" -u $(id -u):$(id -g) pandoc/extra'

export PATH=$PATH:~/.cargo/bin

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word

pfetch

alias nautilus="thunar" # because i keep writing nautilus :)
