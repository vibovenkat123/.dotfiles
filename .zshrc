# export
export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode
# functions
function mkcd(){
  mkdir $1
  cd $1
}
# aliases
alias git="/opt/homebrew/bin/git"
alias gotoprojects="cd ~/workspace/projects"
alias c="code"
alias vi="nvim"
alias ls="exa -al --color=always --group-directories-first"
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
alias grep="grep --color=auto"
alias sed="gsed"
alias emacs='emacsclient -c -a emacs'
# sourcing and path stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


eval "$(pyenv init --path)"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
