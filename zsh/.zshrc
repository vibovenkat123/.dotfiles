# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Functions
function mkcd(){ # Make a directory and cd into it also
  mkdir $1
  cd $1
}

# Aliases
#alias git="/opt/homebrew/bin/git"
#alias gotoprojects="cd ~/workspace/projects"
#alias c="code"
alias vi="nvim"
#alias grep="grep --color=auto"
#alias sed="gsed"
#alias emacs='emacsclient -c -a emacs'
#alias ls="exa"
#alias la="exa -la"
# Exports
# sources and paths
#eval "$(pyenv init --path)"
#
#eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath+=($HOME/.zsh/pure)
autoload -U promptinit 
promptinit
prompt pure
export PATH=$PATH:/usr/local/go/bin
