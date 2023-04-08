bindkey -v
bindkey -s ^f "tmux-sessionizer\n"
export VISUAL=nvim
export EDITOR="$VISUAL"
function mkcd(){ # Make a directory and cd into it also
  mkdir $1
  cd $1
}
function brewsearch() {
    brew list | grep $1
}
export PAGER=bat
function 1() {
    if tmux a -t=personal 2> /dev/null; then
        tmux a -t=personal
    else
        tmux new -d -s personal -c $HOME/personal
        tmux a -t=personal 2> /dev/null
    fi
}
function 2() {
    if tmux a -t=work 2> /dev/null; then
        tmux a -t=work
    else
        tmux new -d -s work -c $HOME/work
        tmux a -t=work 2> /dev/null
    fi
}
function 3() {
    if tmux a -t=dotfiles 2> /dev/null; then
        tmux a -t=dotfiles
    else
        tmux new -d -s dotfiles -c $HOME/.dotfiles
        tmux a -t=dotfiles 2> /dev/null
    fi
}
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
# Aliases
alias nerdfetch="curl -fsSL https://raw.githubusercontent.com/ThatOneCalculator/NerdFetch/master/nerdfetch | sh"
alias ls="exa"
alias ctags="`brew --prefix`/bin/ctags"
alias rmi="rm -i"
alias git="/opt/homebrew/bin/git"
alias grep="ggrep --color=auto"
alias gcc='gcc-12'
alias cc='gcc-12'
alias g++='g++-12'
alias c++='c++-12'
alias gotoicloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias sed="gsed"
alias find="gfind"
alias c="code"
alias goPersonal="cd ~/personal"
alias goWork="cd ~/work"
alias vi="nvim"
# Exports
export icloud_path="~/Library/Mobile\\ Documents/com~apple~CloudDocs"
# sources and paths
eval "$(pyenv init --path)"
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
alias emulator="~/Library/Android/sdk/emulator/emulator"
export PATH="$PATH:$(go env GOPATH)/bin"

[ -f "/Users/vaibhav/.ghcup/env" ] && source "/Users/vaibhav/.ghcup/env" # ghcup-env
