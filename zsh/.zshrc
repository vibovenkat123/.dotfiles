function mkcd(){ # Make a directory and cd into it also
  mkdir $1
  cd $1
}
export PAGER=bat
set -o vi
function goto() {
    name=$(find work personal -type d | fzf)
    if [ "$name" = "" ]; then
        echo "No folder specified"
    elif tmux a -t=$(basename $name) 2> /dev/null; then 
        tmux kill-session -t=$(basename $name)
    else
        tmux new -d -s $(basename $name) -c $HOME/$name
        tmux a -t=$(basename $name) 2> /dev/null
    fi
}
function 1() {
    if tmux a -t=personal 2> /dev/null; then 
        tmux kill-session -t=personal
    else
        tmux new -d -s personal -c $HOME/personal
        tmux a -t=personal 2> /dev/null
    fi 
}
function 2() {
    if tmux a -t=work 2> /dev/null; then 
        tmux kill-session -t=personal
    else
        tmux new -d -s personal -c $HOME/work
        tmux a -t=personal
    fi 
}
# Aliases
alias git="/opt/homebrew/bin/git"
alias c="code"
alias goPersonal="cd ~/personal"
alias goWork="cd ~/work"
alias vi="nvim"
alias grep="rg --color=auto"
alias ls="exa"
alias la="exa -la"
# Exports
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# sources and paths
eval "$(pyenv init --path)"
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

