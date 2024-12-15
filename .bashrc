#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
source /usr/share/nvm/init-nvm.sh

# editor
export EDITOR=nvim
export VISUAL=nvim

# exa
export CARGO_HOME="/home/st/.cargo/bin"
case ":$PATH:" in
  *":$CARGO_HOME:"*) ;;
  *) export PATH="$CARGO_HOME:$PATH" ;;
esac

# pnpm
export PNPM_HOME="/home/st/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fzf
export FZF_DEF_CMD="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEF_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
export FZF_TMUX_OPTS=" -p90%,70% "

# Bind Ctrl+T to invoke fzf to find files
bind '"\C-t": "\C-u$(fd --hidden --strip-cwd-prefix --exclude .git | fzf --preview '\''bat --color=always -n --line-range :500 {}'\'')\e\C-e"'
bind '"\C-f": "\C-u$(fd --type=d --hidden --strip-cwd-prefix --exclude .git | fzf --preview '\''eza --tree --color=always {} | head -200'\'')\e\C-e"'

