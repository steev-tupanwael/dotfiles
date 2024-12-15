set fish_greeting ""
set -gx TERM xterm-256color

alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias yz yazi

set -gx EDITOR nvim

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# fzf
set -Ux FZF_DEFAULT_OPTS "--height 50% --layout=default --border --color=hl:#2dd4bf"
set -Ux FZF_TMUX_OPTS "-p90%,70%"

function fzf_ctrl_t
    set result (fd --hidden --strip-cwd-prefix --exclude .git | fzf --preview "bat --color=always -n --line-range :500 {}")
    if test -n "$result"
        commandline -i $result  # Insert the selected result into the command line
    end
end

bind \ct fzf_ctrl_t

# EOF
zoxide init fish | source
