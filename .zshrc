bindkey -v
export VISUAL=nvim

alias sed="gsed"
alias grep="ggrep"
alias find="gfind"
alias vi="nvim"

dtf() {
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}
