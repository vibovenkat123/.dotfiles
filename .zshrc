function mkcd(){ # Make a directory and cd into it also
  mkdir $1
  cd $1
}

alias git="/opt/homebrew/bin/git"
alias gotoprojects="cd ~/workspace/projects"
alias c="code"
alias vi="nvim"
alias grep="grep --color=auto"
alias sed="gsed"
alias emacs='emacsclient -c -a emacs'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(pyenv init --path)"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
