# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
bindkey -s ^f "goto\n"
function mkcd(){ # Make a directory and cd into it also
  mkdir $1
  cd $1
}
export PAGER=bat
function goto() {
    name=$(find $HOME/work $HOME/personal -type d -not -path '*/.*' | fzf)
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
# Aliases
alias nerdfetch="curl -fsSL https://raw.githubusercontent.com/ThatOneCalculator/NerdFetch/master/nerdfetch | sh"
alias rmi="rm -i"
alias git="/opt/homebrew/bin/git"
alias grep="ggrep --color=auto"
alias c="code"
alias goPersonal="cd ~/personal"
alias goWork="cd ~/work"
alias vi="nvim"
# Exports
# sources and paths
eval "$(pyenv init --path)"
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
alias emulator="~/Library/Android/sdk/emulator/emulator"
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
