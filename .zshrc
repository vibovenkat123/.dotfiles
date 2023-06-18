bindkey -v
export VISUAL=nvim
setopt PROMPT_SUBST
BLUE='\[\033[1;34m\]'
PS1='%F{cyan}%2~ %(?.%F{green}.%F{red})%f %F{magenta}$(parse_git_branch)%f'
parse_git_branch() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        echo "[$(echo $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') | xargs)] "
    fi
}
# Show git status in the PS1
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
