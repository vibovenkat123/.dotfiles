# Functions
function mkcd(){ # Make a directory and cd into it also
  mkdir $1
  cd $1
}

# Aliases
alias git="/opt/homebrew/bin/git"
alias gotoprojects="cd ~/workspace/projects"
alias c="code"
alias vi="nvim"
alias grep="grep --color=auto"
alias sed="gsed"
alias emacs='emacsclient -c -a emacs'
alias ls="exa"
alias la="exa -la"
# Exports
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# sources and paths
eval "$(pyenv init --path)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

