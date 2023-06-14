bindkey -v
export VISUAL=nvim

alias sed="gsed"
alias grep="ggrep"
alias find="gfind"
alias vi="nvim"

dtf() {
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
